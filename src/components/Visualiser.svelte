<script>
    if (typeof window !== 'undefined') {
        function updateBackgroundColor() {
            const r = Math.floor(Math.random() * 256);
            const g = Math.floor(Math.random() * 256);
            const b = Math.floor(Math.random() * 256);
            document.querySelector('.visualiser-container').style.backgroundColor = `rgb(${r}, ${g}, ${b})`;
        }

        setInterval(updateBackgroundColor, 1000);
    }
</script>

<div class="visualiser-container" role="region" aria-label="Interactive Visualiser">    
</div>

<style>
    .visualiser-container {
        width: 100%;
        height: 500px;
        text-align: center;
        background: #1e1e1e;
        color: #fff;
        border-radius: 8px;
        transition: background-color 0.5s ease;
        position: relative;
        overflow: hidden;
    }
</style>