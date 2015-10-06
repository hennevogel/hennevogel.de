---
---

jQuery ->
  Chart.defaults.global.responsive = true
  data = [
    {
        value: 40,
        color: "#46BFBD",
        highlight: "#5AD3D1",
        label: "Development"
    },
    {
        value: 25,
        color: "#FDB45C",
        highlight: "#FFC870",
        label: "Design/UX"
    },
    {
        value: 20,
        color:"#F7464A",
        highlight: "#FF5A5E",
        label: "Operations"
    },
    {
        value: 15,
        color: "#66CD00",
        highlight: "#7FFF00",
        label: "Mangement"
    },
  ]
  
  myNewChart = new Chart($("#myChart").get(0).getContext("2d")).Doughnut(data)
