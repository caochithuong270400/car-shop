<template>
  <div>
    <canvas
      ref="canvas"
      :width="width"
      :height="height"
      @mousedown="startDrawing"
      @mousemove="draw"
      @mouseup="stopDrawing"
      @mouseleave="stopDrawing"
    ></canvas>
    <button @click="exportImage">Export as Image</button>
    <div v-if="imageData">
      <h3>Exported Image:</h3>
      <img :src="imageData" alt="Exported Image" />
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      width: 800,
      height: 600,
      isDrawing: false,
      context: null,
      imageData: null,
    };
  },
  mounted() {
    const canvas = this.$refs.canvas;
    this.context = canvas.getContext("2d");
  },
  methods: {
    getMousePosition(event) {
      const canvas = this.$refs.canvas;
      const rect = canvas.getBoundingClientRect();
      return {
        x: event.clientX - rect.left,
        y: event.clientY - rect.top,
      };
    },
    startDrawing(event) {
      this.isDrawing = true;
      const pos = this.getMousePosition(event);
      this.context.beginPath();
      this.context.moveTo(pos.x, pos.y);
    },
    draw(event) {
      if (!this.isDrawing) return;
      const pos = this.getMousePosition(event);
      this.context.lineTo(pos.x, pos.y);
      this.context.stroke();
    },
    stopDrawing() {
      this.isDrawing = false;
    },
    exportImage() {
      const canvas = this.$refs.canvas;
      this.imageData = canvas.toDataURL("image/png");
      console.log("this.imageData", this.imageData);
    },
  },
};
</script>

<style scoped>
canvas {
  border: 1px solid #000;
  cursor: crosshair;
}
button {
  margin-top: 10px;
}
img {
  margin-top: 10px;
  border: 1px solid #000;
}
</style>
