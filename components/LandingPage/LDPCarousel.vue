<template>
  <v-carousel height="auto" show-arrows="hover" cycle hide-delimiter-background>
    <v-carousel-item v-for="(slide, i) in slides" :key="i">
      <v-img cover no-repeat height="auto" :src="slide.url"></v-img>
    </v-carousel-item>
  </v-carousel>
</template>

<script>
import { storeToRefs } from "pinia";
import { useStore } from "~/store";
export default {
  async mounted() {
    await this.fetch();
  },
  data() {
    return {
      store: storeToRefs(useStore()),
      slides: ["First", "Second", "Third", "Fourth", "Fifth"],
    };
  },
  methods: {
    async fetch() {
      console.log("aaa");
      const { results } = await $fetch("/api/landingPage/carousel", {
        method: "get",
        // body: { test: 123 },
      });
      console.log("results", results);
      this.slides = results;
    },
  },
};
</script>

<style>
</style>