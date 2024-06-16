<template>
  <v-empty-state v-if="data?.new_bill_id" icon="$success">
    <template v-slot:media>
      <v-icon color="surface-variant"></v-icon>
    </template>

    <template v-slot:headline>
      <div class="text-h4">All Done For Now!</div>
    </template>

    <template v-slot:title>
      <div class="text-h6">You're all caught up.</div>
    </template>

    <template v-slot:text>
      <div class="text-medium-emphasis text-caption">
        Great job on completing all your tasks! This might be a good time to
        relax or consider planning your next set of goals. If you think of
        something new, just hit the button below to add a new task.
      </div>
    </template>
  </v-empty-state>

  <v-empty-state
    v-else
    headline="No Messages Yet"
    text="You haven't received any messages yet. When you do, they'll appear here."
    title="Check back later."
  ></v-empty-state>
</template>
<script>
import { useStore } from "~/store";
import { storeToRefs } from "pinia";
export default defineComponent({
  setup() {
    definePageMeta({
      layout: "none",
    });
  },
  data() {
    return {
      store: storeToRefs(useStore()),
      data: null,
    };
  },
  async mounted() {
    await this.asyncData();
    await this.fetchFirstData();
  },
  methods: {
    async fetchFirstData() {
      try {
        const { results } = await $fetch("/api/account/getUser", {
          method: "post",
          body: {
            email: localStorage.getItem("email"),
            password: localStorage.getItem("password"),
          },
        });
        console.log(results);
        if (results.id_user) {
          this.store.state.user = results;
        }
      } catch (error) {
        console.log("Thông tin đăng nhập chưa khớp!", error);
      }
      if (this.store.state.user.id_user && this.data) {
        try {
          const { resultUpdateBillStatus } = await $fetch(
            "/api/payment/update_bill_status",
            {
              method: "post",
              body: {
                data: this.data,
              },
            }
          );
          console.log("resultUpdateBillStatus", resultUpdateBillStatus);
        } catch (error) {
          console.log("Thông tin đăng nhập chưa khớp!", error);
        }
      } else {
        console.log("chưa đăng nhập");
      }
    },
    async asyncData() {
      const data = this.$route.query || "No data provided";
      console.log("data", data);
      this.data = data;
      // return { data };
    },
  },
});
</script>
