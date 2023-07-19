/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{js,jsx,ts,tsx}"],
  theme: {
    extend: {},
    fontFamily: {
      lato: "Lato, sans-serif",
    },
    colors: {
      "dark-green": "#002E00",
      green: "#1e9f1e",
      orange: "#E28000",
      cyan: "#1B8D73",
      "slate-blue1": "#546678",
      "slate-blue2": "#91ACB9",
      "white-1": "#fdfbfb",
      "white-2": "#EBEDEE",
      "white-3": "#E6E9F0",
      "white-4": "#EEF1F5",
      "fondo-de-filtros": "#ebedef",
      "verde-clarito": "#D9E2D9",
      "bordes-input": "#d8dbdc",
    },
  },
  plugins: [],
};
