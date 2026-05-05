import pandas as pd

# Caminho do arquivo original
input_file = "CSV_ANTES.csv"
output_file = "CSV_DEPOIS.csv"

# Ler o CSV ignorando as primeiras linhas "sujas"
df = pd.read_csv(input_file, skiprows=4)

# Filtrar apenas Estados Unidos
df_usa = df[df["Country Name"] == "United States"]

# Selecionar apenas colunas de anos (1960–2025)
year_cols = [col for col in df.columns if col.isdigit()]

# Transformar de formato largo para longo
df_long = df_usa.melt(
    id_vars=["Country Name"],
    value_vars=year_cols,
    var_name="Year",
    value_name="CPI"
)

# Remover valores vazios
df_long = df_long.dropna(subset=["CPI"])

# Converter tipos
df_long["Year"] = df_long["Year"].astype(int)
df_long["CPI"] = df_long["CPI"].astype(float)

# Ordenar por ano
df_long = df_long.sort_values("Year")

# Manter só as colunas finais
df_final = df_long[["Year", "CPI"]]

# Salvar
df_final.to_csv(output_file, index=False)

print(df_final.head(10))