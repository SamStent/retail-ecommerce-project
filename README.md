# 📦 Retail E‑Commerce Analytics  
Análisis completo de ventas, clientes y productos para un negocio de e‑commerce.

---

## 🧭 1. Descripción del proyecto

Este proyecto desarrolla un análisis integral de un dataset de e‑commerce utilizando:

- **PostgreSQL** para modelado y vistas analíticas  
- **Python** (pandas, SQLAlchemy, Plotly) para análisis y visualización  
- **JupyterLab** como entorno de trabajo  
- **Kaleido** para exportación de gráficos  
- **GitHub** como repositorio de portfolio  

El objetivo es construir un flujo analítico profesional, modular y reproducible, que permita entender el rendimiento del negocio y comunicar insights ejecutivos de forma clara.

---

## 🗂 2. Estructura del repositorio

```
retail-ecommerce-project/
│
├── assets/                     # Gráficos exportados para el README
│   ├── revenue_mensual.png
│   ├── revenue_ciudad.png
│   ├── top_productos.png
│
├── notebooks/
│   ├── 01_eda.ipynb            # Exploración inicial
│   └── 02_analysis.ipynb       # KPIs, análisis avanzado y storytelling
│
├── sql/
│   ├── 01_schema.sql           # Modelo relacional
│   ├── 03_analytics_queries.sql
│   ├── 04_views.sql
│   └── 05_KPIs.sql
│
├── src/
│   └── load_data.py            # Script auxiliar
│
└── README.md                   # Documentación del proyecto
```

---

## 📊 3. KPIs ejecutivas

### 🛒 Ventas
- **Revenue total:** 3,966,544.57  
- **Número total de órdenes:** 100  
- **Ticket promedio:** 39,665.44  
- **LTV promedio (básico):** 40,474.94  

### 👥 Clientes
- **Número total de clientes:** *(calculado en notebook)*  
- **Ciudad con mayor revenue:** Kolkata  

### 📦 Productos  
**Top 5 productos por revenue:**

1. Smartphone — 113,810.50  
2. Curtains — 110,013.00  
3. Curtains — 109,630.75  
4. Comics — 107,083.86  
5. Curtains — 106,022.00  

### ⭐ Ratings
- **Rating promedio general:** 2.94 / 5  
- **Categoría mejor valorada:** *(calculado en notebook)*  

---

## 📈 4. Visualizaciones principales

> Las visualizaciones completas se encuentran en los notebooks y en la carpeta `assets/`.

### **Revenue mensual**
`[Parece que el resultado no era seguro para mostrar. ¡Cambiemos de enfoque y probemos algo diferente!]`

### **Top productos por revenue**
`[Parece que el resultado no era seguro para mostrar. ¡Cambiemos de enfoque y probemos algo diferente!]`

### **Revenue por ciudad**
`[Parece que el resultado no era seguro para mostrar. ¡Cambiemos de enfoque y probemos algo diferente!]`

---

## 🧠 5. Storytelling del análisis

El análisis revela patrones clave del negocio:

### **1. Revenue sólido y estable**  
El negocio genera casi **4M** en revenue, con un ticket promedio alto.  
Esto indica un catálogo de productos de valor medio‑alto.

### **2. Concentración geográfica**  
**Kolkata** es la ciudad líder en revenue, seguida por Chennai.  
Esto sugiere oportunidades para expandir campañas en ciudades con menor penetración.

### **3. Categorías dominantes**  
Las categorías **Home**, **Books** y **Electronics** concentran la mayor parte del revenue.  
El negocio debería reforzar inventario y promociones en estas líneas.

### **4. Estacionalidad moderada**  
El revenue mensual muestra picos en agosto–septiembre y febrero–marzo.  
Esto puede relacionarse con campañas estacionales o ciclos de compra.

### **5. Distribución desigual del gasto**  
Un pequeño grupo de clientes genera una parte significativa del revenue.  
Esto abre la puerta a estrategias de **retención y fidelización**.

---

## 🖥 6. Dashboard interactivo

Este proyecto incluye un dashboard ligero construido con **Streamlit + Plotly**.

Para ejecutarlo:

```bash
streamlit run src/dashboard.py
```

El dashboard muestra:

- KPIs principales  
- Revenue mensual  
- Top productos  
- Revenue por ciudad  

---

## 🛠 7. Tecnologías utilizadas

- Python (pandas, SQLAlchemy, Plotly)  
- PostgreSQL  
- JupyterLab  
- Kaleido  
- Conda  
- Git & GitHub  
- Streamlit  

---

## 🚀 8. Próximos pasos

- Agregar filtros interactivos al dashboard  
- Segmentación avanzada de clientes  
- Modelos predictivos (LTV, churn, forecasting)  

---

## 👤 9. Autor

**Federico Wuttke**  
Proyecto desarrollado como parte de un portfolio profesional de análisis de datos.

---