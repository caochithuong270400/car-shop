<template>
  <LDPCarousel />
  <LDPService />
  <LDPTypical />
  <LDPProduce />
  <LDPBelt />
  <LDPReasonToBuy />
  <!-- <LDPNews /> -->
  <LDPQuote />
</template>

<script>
import { storeToRefs } from "pinia";
import { useStore } from "~/store";
import LDPCarousel from "~/components/LandingPage/LDPCarousel.vue";
import LDPService from "~/components/LandingPage/LDPService.vue";
import LDPTypical from "~/components/LandingPage/LDPTypical.vue";
import LDPProduce from "~/components/LandingPage/LDPProduce.vue";
import LDPBelt from "~/components/LandingPage/LDPBelt.vue";
import LDPReasonToBuy from "~/components/LandingPage/LDPReasonToBuy.vue";
import LDPQuote from "~/components/LandingPage/LDPQuote.vue";
// import LDPNews from "~/components/LandingPage/LDPNews.vue";
export default {
  components: {
    LDPCarousel,
    LDPService,
    LDPTypical,
    LDPProduce,
    LDPBelt,
    LDPReasonToBuy,
    // LDPNews,
    LDPQuote,
  },
  mounted() {},
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

<style scoped>
.mini_top_card {
  margin: 0.1vw;
  padding: 2vw;
  box-shadow: 0 0 15px #0f7bc050;
}
.mini_top_card:hover {
  box-shadow: 0 0 15px #0f7bc070;
}
</style>