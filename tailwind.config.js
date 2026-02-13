/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{js,jsx}'],
  theme: {
    extend: {
      colors: {
        milan: {
          deep: '#4c2ca3',
          medium: '#7f43d9',
          soft: '#f4efff',
          accent: '#ef52a0'
        }
      },
      boxShadow: {
        card: '0 8px 30px rgba(88, 46, 162, 0.13)'
      }
    }
  },
  plugins: []
};
