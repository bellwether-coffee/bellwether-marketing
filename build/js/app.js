$(function(){return $("img.svg").each(function(){var t,r,e,a;return t=$(this),e=t.attr("id"),r=t.attr("class"),a=t.attr("src"),$.get(a,function(a){var i;return i=$(a).find("svg"),"undefined"!=typeof e&&(i=i.attr("id",e)),"undefined"!=typeof r&&(i=i.attr("class",r+" replaced-svg")),i=i.removeAttr("xmlns:a"),!i.attr("viewBox")&&i.attr("height")&&i.attr("width")&&i.attr("viewBox","0 0 "+i.attr("height")+" "+i.attr("width")),t.replaceWith(i)},"xml")})});