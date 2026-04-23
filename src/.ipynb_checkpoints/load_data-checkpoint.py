import os
import pandas as pd
from sqlalchemy import create_engine

# Ruta absoluta al CSV
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
csv_path = os.path.join(BASE_DIR, "..", "data", "ecommerce_sales_data.csv")

print("Leyendo CSV desde:", csv_path)

# 1. Leer CSV
df = pd.read_csv(csv_path)

# 2. Convertir fecha
df["Order Date"] = pd.to_datetime(df["Order Date"], dayfirst=True)

# 3. Crear tabla customers
customers = df[["Customer ID", "Gender", "Age", "City"]].drop_duplicates()
customers.columns = ["customer_id", "gender", "age", "city"]

# 4. Crear tabla products
products = df[["Product Name", "Product Category", "Price"]].drop_duplicates()
products.columns = ["product_name", "product_category", "price"]

# 5. Crear tabla orders
orders = df[["Order ID", "Customer ID", "Order Date", "Payment Method"]].drop_duplicates()
orders.columns = ["order_id", "customer_id", "order_date", "payment_method"]

# 6. Crear tabla order_items
order_items = df[["Order ID", "Product Name", "Quantity", "Rating"]].copy()
order_items.columns = ["order_id", "product_name", "quantity", "rating"]

# 7. Conectar a PostgreSQL
engine = create_engine("postgresql://postgres:postgres@localhost:5432/retail")

# 8. Insertar customers
customers.to_sql("customers", engine, if_exists="append", index=False)

# 9. Insertar products y recuperar product_id
products.to_sql("products", engine, if_exists="append", index=False)

# Obtener tabla products con IDs
products_db = pd.read_sql("SELECT product_id, product_name FROM products", engine)

# 10. Merge para obtener product_id en order_items
order_items = order_items.merge(products_db, on="product_name", how="left")

# 11. Insertar orders
orders.to_sql("orders", engine, if_exists="append", index=False)

# 12. Insertar order_items final
order_items_final = order_items[["order_id", "product_id", "quantity", "rating"]]
order_items_final.to_sql("order_items", engine, if_exists="append", index=False)

print("Carga completada con éxito.")