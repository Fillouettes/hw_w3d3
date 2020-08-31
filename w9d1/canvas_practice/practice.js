document.addEventListener("DOMContentLoaded", function(){
    var canvas = document.getElementById("mycanvas");
    var ctx = canvas.getContext("2d");
    ctx.fillStyle = "red";
    ctx.fillRect(0,0,500,500);

    ctx.beginPath();
    ctx.arc(100, 100, 50, 0, 2*Math.PI, true);
    ctx.strokeStyle = "purple";
    ctx.lineWidth = 5;
    ctx.stroke();

    ctx.fillStyle = "yellow";
    ctx.fill();
});
