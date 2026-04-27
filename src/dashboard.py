import streamlit as st
import pandas as pd
import plotly.express as px
from sqlalchemy import create_engine

# -----------------------------
# CONFIGURACIÓN DEL DASHBOARD
# -----------------------------
st.set_page_config(
    page_title="Retail E‑Commerce Dashboard",
    layout="wide"
)

st.title("📦 Retail E‑Commerce Dashboard")
st.markdown("Dashboard ligero construido con **Streamlit + Plotly**.")

# -----------------------------
# CONEXIÓN A LA BASE DE DATOS
# -----------------------------
engine = create_engine("postgresql://postgres:postgres@localhost:5432/retail")

# -----------------------------
# CARGA DE DATOS DESDE POSTGRES
# -----------------------------

# Revenue mensual
monthly_sales = pd.read_sql("SELECT * FROM vw_monthly_sales", engine)

# Ajuste de nombres si es necesario
if "order_month" in monthly_sales.columns:
    monthly_sales.rename(columns={"order_month": "month"}, inplace=True)

# Top productos
top_products = pd.read_sql("SELECT * FROM vw_product_performance", engine)

# Revenue por ciudad
revenue_city = pd.read_sql("SELECT * FROM vw_city_sales", engine)


# -----------------------------
# SECCIÓN 1 — KPIs
# -----------------------------
st.header("📊 KPIs principales")

col1, col2, col3, col4 = st.columns(4)

col1.metric("Revenue total", f"{monthly_sales['revenue'].sum():,.2f}")
col2.metric("Órdenes totales", "100")  # si tenés vista, lo reemplazamos
col3.metric("Ticket promedio", f"{monthly_sales['revenue'].mean():,.2f}")
col4.metric("LTV promedio", "40,474.94")  # opcional

# -----------------------------
# SECCIÓN 2 — Revenue mensual
# -----------------------------
st.header("📅 Revenue mensual")

fig1 = px.line(
    monthly_sales,
    x="month",
    y="revenue",
    markers=True,
    title="Revenue mensual"
)
st.plotly_chart(fig1, use_container_width=True)

# -----------------------------
# SECCIÓN 3 — Top productos
# -----------------------------
st.header("🏆 Top productos por revenue")

fig2 = px.bar(
    top_products,
    x="product_name",
    y="revenue",
    title="Top productos por revenue"
)
st.plotly_chart(fig2, use_container_width=True)

# -----------------------------
# SECCIÓN 4 — Revenue por ciudad
# -----------------------------
st.header("🌍 Revenue por ciudad")

fig3 = px.bar(
    revenue_city,
    x="city",
    y="revenue",
    title="Revenue por ciudad"
)
st.plotly_chart(fig3, use_container_width=True)
