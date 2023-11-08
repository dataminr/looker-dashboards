// Use Looker's Visualization API
looker.plugins.visualizations.add({
  id: 'display_count',
  label: 'Display Count',
  create: function(element, config) {
    // Create a container for the count value
    this.container = element.appendChild(document.createElement("div"));
    this.container.setAttribute("id", "count-line-container");

    // Applying Styling to the container
    this.container.style.fontWeight = "bold";
    this.container.style.textAlign = "center";
    this.container.style.padding = "25px";
    this.container.style.display = "flex";
    this.container.style.flexDirection = "column";
    this.container.style.alignItems = "center";

    // Create a container for the text line
    this.textContainer = element.appendChild(document.createElement("div"));
    this.textContainer.setAttribute("id", "text-line-container");
    this.textContainer.style.fontSize = "16px";
    this.textContainer.style.textAlign = "center";
    this.textContainer.style.padding = "5px";
    this.textContainer.style.fontFamily = "Arial";


   // Create a container element for your chart
    this.parentNode = document.createElement("div");
    this.parentNode.style.display = "flex";
    this.parentNode.style.flexDirection = "column";
    this.parentNode.style.alignItems = "center";
    this.chart_container = document.createElement("canvas")
    this.chart_container.className = "line-chart-container";
    this.parentNode.appendChild(this.chart_container);
    element.appendChild(this.parentNode);

  },

  updateAsync: function(data, element, config, queryResponse, details, done) {
    var threatcolumn = queryResponse.fields.measure_like[0].name
    // Calculate the count value from the data
    const count = data.length;
    let list=[]
    let list1=[]
    for (var i of queryResponse.fields.measures) {
      var th = document.createElement('th');
      list.push(i.name);
    }
    data.forEach(function (row) {
      Object.keys(row).forEach(function (key) {
        list1.push(row[key].value);
      });
    });
    // Calculate the percentage value based on the available count
    const estimatedTotalItems = 100;
    const threat_count = count ? data[0][threatcolumn].value:0;
    var threat1_count = 0;
    if (count != 1) {
        threat1_count = count ? data[1][threatcolumn].value:0;
    }
    const threat_count_difference = threat_count - threat1_count;
    var percentage = 0;
    if (count != 1) {
        percentage = count ? Math.trunc((threat_count_difference / threat1_count) * estimatedTotalItems):0;
    }
    const arrowIcon = percentage > 0 ? '➚' : '➘';

    var color;
    if (percentage <= 0) {
      color = 'green';
    }
    else {
      color = 'red';
    }
    percentage = (percentage == 0)?'N/A':percentage+'%'
    // Display the count and percentage value in the container
    this.container.innerHTML = `
      <div style="display: flex; align-items: center;">
        <div style="font-size: 60px; font-family: Arial, Helvetica, sans-serif;">${threat_count}</div>
        <div style="display: flex; flex-direction: column; align-items: flex-start;">
          <div style="font-size: 30px; font-family: Arial, Helvetica, sans-serif; color: ${color};">${arrowIcon}</div>
          <div style="font-size: 20px; text-align: right; font-family: Arial, Helvetica, sans-serif; color: ${color};">${percentage}</div>
        </div>
      </div>
    `;

    // Display the text line below the count value
    this.textContainer.textContent = "Today vs Yesterday";
    this.textContainer.style.fontSize = "12px";
    this.textContainer.style.fontFamily = "Arial, Helvetica, sans-serif";

    // Extract data from Looker's query response
    var labels = [];
    var datasets = [];

    var xField = queryResponse.fields.dimension_like[0].name;
    var yField = queryResponse.fields.measure_like[0].name;

    // Populate labels and datasets based on your data model
    data.forEach(function(row) {
      datasets.push(row[yField].value ? row[yField].value : 0);
      labels.push(row[xField].value);
    });


    // Initialize a Chart.js instance
      var ctx = this.chart_container;
      if (this.chart) {
        this.chart.destroy();
      }
      this.chart = new Chart(ctx, {
        type: "line", // Specify the chart type as a line chart
        data: {
          labels: labels,
          datasets: [{
            label: null,
            data: datasets,
            fill: false,
            borderColor: color,
            pointRadius: 0,
            tension: 0.1
          }],
        },
        options: {
          responsive: false,
          maintainAspectRatio: true,
          scales: {
            x: {
              display: false, // Hide the X-axis
            },
            y: {
              display: false, // Hide the Y-axis
            },
          },
          plugins: {
              legend: {
                    display: false,
              }
          }
        },
      });

    this.chart.canvas.style.height = '50px';
    this.chart.canvas.style.width = '200px';
    // Update the chart
    this.chart.update();

    // Signal the completion of rendering
    done();
  }
});
