<template>
  <v-container
    fluid
    style="
      background-color: var(--sub-background-color);
      text-align: center;
      padding: 3vw 5vw;
    "
  >
    <v-row>
      <v-col cols="12" md="6"> </v-col>
      <v-col cols="12" md="6" style="font-size: 2vw" class="title-text">
        CƠ SỞ VẬT CHẤT <br />
        <span>HONDA ÔTÔ BÌNH DƯƠNG</span>
      </v-col>
    </v-row>
    <v-row class="pa-4">
      <v-col cols="12" md="6">
        <h2 class="title-text">NHỮNG LỢI ÍCH MANG LẠI CHO KHÁCH HÀNG</h2>
        <v-expansion-panels
          class="d-flex"
          flat
          style="text-align: left"
          variant="accordion"
          multiple
        >
          <v-expansion-panel
            style="
              background-color: var(--sub-background-color);
              color: var(--primary-color);
            "
          >
            <v-expansion-panel-title
              collapse-icon="mdi-menu-up"
              expand-icon="mdi-menu-right"
              class="title-expanel"
            >
              Ưu Đãi Khuyến Mãi Hấp Dẫn
            </v-expansion-panel-title>
            <v-expansion-panel-text>
              <b>Honda Ôtô Bình Dương</b> luôn cam kết mang lại mức giá tốt cùng
              với nhiều chương trình ưu đãi khuyến mãi hấp dẫn trong tháng dành
              cho quý khách, cùng với sự tư vấn tận tâm, chuyên nghiệp nhất.
            </v-expansion-panel-text>
            <v-divider></v-divider>
          </v-expansion-panel>
          <v-expansion-panel
            style="
              background-color: var(--sub-background-color);
              color: var(--primary-color);
            "
          >
            <v-expansion-panel-title
              collapse-icon="mdi-menu-up"
              expand-icon="mdi-menu-right"
              class="title-expanel"
            >
              Trang Thiết Bị Hiện Đại
            </v-expansion-panel-title>
            <v-expansion-panel-text>
              Trang thiết bị nhập khẩu hiện đại, đáp ứng những nhu cầu khắt khe
              nhất. Phòng sơn đạt chuẩn quốc tế, sử dụng hệ thống khuấy sơn pha
              màu tiên tiến trong khu vực khép kín, đảm bảo vệ sinh môi trường.
            </v-expansion-panel-text>
            <v-divider></v-divider>
          </v-expansion-panel>
          <v-expansion-panel
            style="
              background-color: var(--sub-background-color);
              color: var(--primary-color);
            "
          >
            <v-expansion-panel-title
              collapse-icon="mdi-menu-up"
              expand-icon="mdi-menu-right"
              class="title-expanel"
            >
              Hết Lòng Vì Khách Hàng
            </v-expansion-panel-title>
            <v-expansion-panel-text>
              Với tiêu chí không ngừng nỗ lực để đem đến cho khách hàng những
              sản phẩm và dịch vụ tốt nhất, showroom
              <b>Honda Ôtô Bình Dương</b> xây dựng cơ sở hạ tầng hiện đại: Phòng
              chờ tiêu chuẩn với đầy đủ các tiện nghi phục vụ cho khách hàng mua
              xe mới, bảo dưỡng và thay thế phụ tùng. Tại đây, trong thời gian
              chờ phục vụ quý khách hàng có thể các thiết bị giải trí cao cấp
              nhu internet tốc độ cao, truyền hình full HD, quầy bar cao cấp với
              menu đa dạng đáp ứng nhu cầu của quý khách.
            </v-expansion-panel-text>
            <v-divider></v-divider>
          </v-expansion-panel>
        </v-expansion-panels>
      </v-col>
      <v-col cols="12" md="6" style="text-align: center; padding: 0 12vw">
        <v-img
          class="small-img"
          src="https://otohondabinhduong5s.net/wp-content/uploads/2023/08/honda-oto-binh-duong-7-400x300.jpg"
        ></v-img>
        <br />
        <h3 class="title-text">Phòng kinh doanh</h3>
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
.small-img {
  border-radius: 5px;
  box-shadow: 0px 0px 15px var(--shadow-small-img);
}

.title-expanel {
  color: var(--primary-color);
  font-weight: bold;
}

.title-text {
  color: var(--title-color);
}
</style>