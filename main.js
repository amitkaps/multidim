window.onload = function () {

  const output = document.querySelector("main");  
  const marked = window.marked;
  const renderer = new marked.Renderer();

  const defaultFont = "Monaco, Consolas, monospace",
        defaultSymbolSize = 100,
        defaultStrokeWidth = 1,
        defaultColor = '#000',
        black = "#000",
        gray = '#888',
        lightGray = '#ddd';


 config = {
    "autosize": "fit",
    "background": "whitesmoke",
    
    // defaults for basic mark types
    // each subset accepts mark properties (fill, stroke, etc)
    "mark": null,
    "arc": { "fill": defaultColor },
    "area": { "fill": defaultColor },
    "image": null,
    "line": {
      "stroke": defaultColor,
      "strokeWidth": defaultStrokeWidth
    },
    "path": { stroke: defaultColor },
    "rect": { fill: defaultColor },
    "rule": { "stroke": black },
    "shape": { stroke: defaultColor },
    "symbol": {
      "stroke": defaultColor,
      "size": defaultSymbolSize
    },
    "text": {
      "fill": "black",
      "font": defaultFont,
      "fontSize": 11
    }, 

    "style": {
      // axis & legend labels
      "guide-label": {
        "fill": "black",
        "font": defaultFont,
        "fontSize": 10
      },
      // axis & legend titles
      "guide-title": {
        "fill": "black",
        "font": defaultFont,
        "fontSize": 11,
        "fontWeight": 'bold'
      },
      // headers, including chart title
      "group-title": {
        "fill": "black",
        "font": defaultFont,
        "fontSize": 13,
        "fontWeight": 'bold'
      },
      // defaults for styled point marks in Vega-Lite
      "point": {
        "size": defaultSymbolSize,
        "strokeWidth": defaultStrokeWidth,
        "stroke": defaultColor,
        "shape": 'circle'
      },
      "circle": {
        "size": defaultSymbolSize,
        "fill": defaultColor
      },
      "square": {
        "size": defaultSymbolSize,
        "strokeWidth": defaultStrokeWidth,
        "shape": 'square'
      },
      "cell": {
        "stroke": null
      }
    },
    "axis": {
      "grid": true,
      "gridColor": 'none',
      "titlePadding": 10
    },
      // defaults for group title
      "title": {
        "offset": 5
    },
  };
  
  const specs = [];
	opts = {  
          "mode": "vega-lite",
          "renderer": "svg",
          "actions": {export: false, source: false, editor: false},
          "config": config
        };
  
  marked.setOptions({
    renderer: new marked.Renderer(),
    headerPrefix: false
  })

  vegaliteRender = function () {
    let specs = document.getElementsByClassName('lang-vis')
		let num = specs.length;
		for (var i=0; i < num; i++) {
      el = "#vis-" + i;
      jsonVis = YAML.parse(specs[i].textContent);
      console.log(vl.compile(jsonVis).spec == undefined)
      htmlString = "<div id='vis-" + i + "'></div>"
      specs[i].parentNode.insertAdjacentHTML('afterend', htmlString);
      specs[i].parentNode.display = 'none';
      vega.embed(el, jsonVis, opts);
    };
  };
  
 
  getChapter = function () {
    let hash = window.location.hash
    let file = hash.replace("#", "");
    let fileName = file == "" ? "index.md" : file + ".md";
    let fileUrl = "chapter/" + fileName;

    fetch(fileUrl).then(data => data.text()).then(data => {
      output.innerHTML = marked(data)
      vegaliteRender();
    });
  }


  window.onhashchange = function () {getChapter();}
  getChapter();  

}
