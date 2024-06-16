<template>
  <v-container>
    <v-row>
      <v-col style="text-align: center">
        <h2>VÌ SAO NÊN MUA XE TẠI</h2>
        <h1 style="color: var(--title-color)">Honda Ôtô Bình Dương</h1>
      </v-col>
    </v-row>
    <v-row max-width="1200px">
      <v-col cols="12" md="6">
        <v-img
          src="https://otohondabinhduong5s.net/wp-content/uploads/2023/08/honda-oto-binh-duong-1-1.jpg"
          style="border-radius: 10px"
        ></v-img>
      </v-col>
      <v-col cols="12" md="6">
        <v-row
          class="d-flex align-center justify-center"
          style="color: var(--primary-color)"
        >
          <v-col cols="2">
            <v-btn
              icon="mdi-tag-text-outline"
              size="x-large"
              :color="store.style.title_color"
            ></v-btn>
          </v-col>
          <v-col cols="10">
            <p class="title_why_to_buy">CAM KẾT BÁN GIÁ RẺ NHẤT</p>
            Với nhiều Chương trình khuyến mãi hấp dẫn, quà tặng đặc biệt và liên
            kết với mạng lưới ngân hàng lớn mạnh tại Việt Nam sẽ giúp cho người
            dùng yên tâm về Honda Ôtô Bình Dương.
          </v-col>
        </v-row>

        <v-row
          class="d-flex align-center justify-center"
          style="color: var(--primary-color)"
        >
          <v-col cols="2">
            <v-btn
              icon="mdi-account-group"
              size="x-large"
              :color="store.style.title_color"
            ></v-btn>
          </v-col>
          <v-col cols="10">
            <p class="title_why_to_buy">HẾT LÒNG VÌ KHÁCH HÀNG</p>
            Đội ngũ tư vấn bán hàng luôn sẵn lòng giúp tư vấn để tìm ra chiếc xe
            ưng ý cho quý khách hàng. Hỗ trợ 24/7 tận tâm, nhiệt tình, có trách
            nhiệm.
          </v-col>
        </v-row>

        <v-row
          class="d-flex align-center justify-center"
          style="color: var(--primary-color)"
        >
          <v-col cols="2">
            <v-btn
              icon="mdi-domain"
              size="x-large"
              :color="store.style.title_color"
            ></v-btn>
          </v-col>
          <v-col cols="10">
            <p class="title_why_to_buy">ĐẠI LÝ TỐT NHẤT</p>
            Chúng tôi tự hào là đại lý bán hàng tốt nhất trong những năm qua,
            với đội ngũ nhân viên đào tạo chuyên nghiệp luôn nằm top tư vấn bán
            hàng xuất sắc trong hệ thống sẽ mang đến chất lượng, dịch vụ tốt
            nhất.
          </v-col>
        </v-row>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { storeToRefs } from "pinia";
import { useStore } from "~/store";
export default {
  data() {
    return {
      store: storeToRefs(useStore()),
    };
  },
};
</script>

<style scoped>
.title_why_to_buy {
  font-size: 20px;
  font-weight: 600;
  color: var(--title-color);
}
</style>