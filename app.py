import streamlit as st
import numpy as np
import pandas as pd

# Set a title for the app
st.title("Welcome to My Streamlit App")

# Add a slider for user input
st.write("### Adjust the slider to generate a random dataset")
slider_value = st.slider("Select number of data points", 1, 100, 50)

# Generate random data
data = np.random.randn(slider_value, 2)
df = pd.DataFrame(data, columns=["Column 1", "Column 2"])

# Display the data in a table
st.write("### Random Data Table")
st.dataframe(df)

# Plot the data
st.write("### Random Data Chart")
st.line_chart(df)
