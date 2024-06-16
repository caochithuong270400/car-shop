<template>
  <v-card
    class="card_style"
    image="https://img.freepik.com/free-vector/blue-dna-blue-medical-healthcare-background_1017-24093.jpg"
    theme="dark"
  >
    <v-app-bar class="app-bar">
      <template v-slot:prepend>
        <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
        <NuxtLink to="/">
          <v-img width="13vw" src="/img/Honda-Logo.png"></v-img>
        </NuxtLink>
      </template>
      <v-app-bar-title class="app-bar-title">
        <v-row justify="center">
          <v-col>
            <v-tabs
              v-model="tab"
              color="light-green-accent-2"
              align-tabs="center"
              show-arrows
            >
              <v-tab
                v-for="item in layout.app_bar.items"
                :key="item.id"
                :value="item.id"
                @click="item.path ? $router.push({ path: item.path }) : null"
              >
                {{ item.title }}
                <v-menu
                  v-if="item.list?.length > 0"
                  activator="parent"
                  open-on-hover
                >
                  <v-list>
                    <v-list-item
                      v-for="(item2, index) in item.list"
                      :key="index"
                      :value="index"
                    >
                      <v-list-item-title>{{ item2.title }}</v-list-item-title>
                    </v-list-item>
                  </v-list>
                </v-menu>
              </v-tab>
            </v-tabs>
          </v-col>
        </v-row>
      </v-app-bar-title>
      <v-btn icon>
        <v-icon>mdi-magnify</v-icon>
      </v-btn>
    </v-app-bar>

    <v-navigation-drawer
      v-model="drawer"
      class="app-bar"
      permanent
      style="padding: 1vw"
    >
      <v-switch
        v-model="store.state.model"
        :label="`Chế độ tối: ${store.state.model ? 'Đã bật' : 'Đã tắt'}`"
        hide-details
        inset
      ></v-switch>
      <!-- <v-list color="transparent">
        <NuxtLink
          v-for="item in layout.nav_draw_now.items"
          :key="item.id"
          :to="item.path"
          class="link_style"
        >
          <v-list-item
            :value="item.id"
            width="100%"
            color="light-green-accent-2"
            :prepend-icon="item.icon"
            :title="item.title"
          >
          </v-list-item>
        </NuxtLink>
      </v-list> -->

      <template v-slot:append>
        <div class="pa-2">
          <v-btn block @click="logOut()"> Logout </v-btn>
        </div>
      </template>
    </v-navigation-drawer>
    <v-main>
      <v-card theme="light" style="padding: 0 !important"> <slot /> </v-card
      ><v-footer class="d-flex flex-column" style="background-color: black">
        <v-row>
          <v-col>
            <v-btn
              v-for="icon in icons"
              :key="icon"
              :icon="icon"
              class="mx-4"
              variant="text"
            ></v-btn>
          </v-col>
        </v-row>
        <v-row>
          <v-col cols="12" md="3">
            <v-img
              class="small-img"
              src="https://otohondabinhduong5s.net/wp-content/uploads/2023/08/honda-oto-binh-duong-7-400x300.jpg"
            ></v-img>
          </v-col>
          <v-col cols="12" md="3">
            <h3>Honda Ôtô Bình Dương</h3>
            <hr class="footer_hr" />
            <br />
            <v-row>
              <v-col cols="1">
                <v-icon>mdi-map-marker</v-icon>
              </v-col>
              <v-col cols="10">
                <b>Địa Chỉ:</b> Đại lộ Bình Dương, Khu Phố Bình Đức 2, Phường
                Bình Hòa, Thành Phố Thuận An, Tỉnh Bình Dương
              </v-col>
            </v-row>

            <v-row>
              <v-col cols="1">
                <v-icon>mdi-deskphone</v-icon>
              </v-col>
              <v-col cols="10"> <b>Hotline:</b> 090 317 3345 </v-col>
            </v-row>
            <v-row>
              <v-col cols="1">
                <v-icon>mdi-email</v-icon>
              </v-col>
              <v-col cols="10"> <b>Email:</b> benhuynh1910@gmail.com </v-col>
            </v-row>
            <v-row>
              <v-col cols="1">
                <v-icon>mdi-facebook</v-icon>
              </v-col>
              <v-col cols="10"> <b>Facebook:</b> Huynhbenhondabinhduong </v-col>
            </v-row>
          </v-col>
          <v-col cols="12" md="3">
            <h3>Xe Honda Ôtô</h3>
            <hr class="footer_hr" />
            <br />
            <v-icon>mdi-menu-right</v-icon>Honda BR-V <br />
            <hr class="text_hr" />
            <v-icon>mdi-menu-right</v-icon>Honda City <br />
            <hr class="text_hr" />
            <v-icon>mdi-menu-right</v-icon>Honda Civic <br />
            <hr class="text_hr" />
            <v-icon>mdi-menu-right</v-icon>Honda HR-V<br />
            <hr class="text_hr" />
            <v-icon>mdi-menu-right</v-icon>Honda CR-V<br />
            <hr class="text_hr" />
            <v-icon>mdi-menu-right</v-icon>Honda Accord <br />
            <hr class="text_hr" />
            <v-icon>mdi-menu-right</v-icon>Honda Civic Type R<br />
            <hr class="text_hr" />
          </v-col>
          <v-col cols="12" md="3">
            <h3>Thông Tin Nhanh</h3>
            <hr class="footer_hr" />
            <br />
            <v-icon>mdi-minus</v-icon>Bảng Giá Chi Tiết<br />
            <v-icon>mdi-minus</v-icon>Tính Phí Lăn Bánh<br />
            <v-icon>mdi-minus</v-icon>Thủ Tục Trả Góp<br />
            <v-icon>mdi-minus</v-icon>Đăng Ký lái thử<br />
          </v-col>
        </v-row>

        <v-divider></v-divider>

        <div>
          {{ new Date().getFullYear() }} — <strong>Thiết kế bởi Gnou</strong>
        </div>
      </v-footer>
    </v-main>
  </v-card>
</template>

<script>
import { storeToRefs } from "pinia";
import { useStore } from "~/store";
export default {
  data() {
    return {
      storeMethod: useStore(),
      store: storeToRefs(useStore()),
      icons: ["mdi-facebook", "mdi-twitter", "mdi-linkedin", "mdi-instagram"],
      items2: [
        { title: "Click Me" },
        { title: "Click Me" },
        { title: "Click Me" },
        { title: "Click Me 2" },
      ],
      items: [
        { text: "Real-Time", icon: "mdi-clock" },
        { text: "Audience", icon: "mdi-account" },
        { text: "Conversions", icon: "mdi-flag" },
      ],
      layout: {
        app_bar: {
          items: [
            {
              id: 1,
              icon: null,
              title: "Quản lý sản phẩm",
              permission: ["admin", "LH", "KD", "KH"],
              path: "/admin/car",
            },
            {
              id: 2,
              icon: null,
              title: "Quản lý đơn hàng",
              permission: ["admin", "LH", "KD", "KH"],
              path: "/admin/bill",
            },
            {
              id: 3,
              icon: null,
              title: "Quản lý tài khoản",
              permission: ["admin", "LH"],
              path: "/admin/account",
              // list: [],
            },
          ],
        },
        // nav_draw: {
        //   items: [
        //     {
        //       id: 1,
        //       icon: "mdi-view-dashboard",
        //       title: "Dashboard",
        //       path: "/",
        //       app_bar_id: 1,
        //     },
        //     {
        //       id: 2,
        //       icon: "mdi-domain",
        //       title: "Danh sách công ty",
        //       path: "/table_manage/companies",
        //       app_bar_id: 2,
        //       permission: ["admin", "KH", "KD"],
        //     },
        //     {
        //       id: 3,
        //       icon: "mdi-medical-bag",
        //       title: "Danh sách gói khám",
        //       path: "/table_manage/company_packages",
        //       app_bar_id: 2,
        //     },
        //     {
        //       id: 4,
        //       icon: "mdi-account-box",
        //       title: "Danh sách bệnh nhân",
        //       path: "/table_manage/patients",
        //       app_bar_id: 2,
        //       permission: ["admin", "KH", "KD"],
        //     },
        //     {
        //       id: 5,
        //       icon: "mdi-calendar-today",
        //       title: "Danh sách lịch hẹn",
        //       path: "/schedule_manage/examination_schedule",
        //       app_bar_id: 3,
        //       permission: ["admin", "LH"],
        //     },
        //     {
        //       id: 6,
        //       icon: "mdi-clipboard-clock-outline",
        //       title: "Số lượng khám thực",
        //       path: "/table_manage/real_examination",
        //       app_bar_id: 3,
        //       permission: ["admin", "LH"],
        //     },
        //     {
        //       id: 7,
        //       icon: "mdi-file-export",
        //       title: "Báo cáo trong ngày",
        //       path: "/",
        //       app_bar_id: 4,
        //       permission: ["admin"],
        //     },
        //   ],
        // },
        nav_draw_now: {
          items: [
            {
              id: 1,
              icon: "mdi-view-dashboard",
              title: "Dashboard",
              path: "/",
            },
          ],
        },
      },
      overlay: true,
      text: "dashboard",
      tab: null,
      drawer: false,
    };
  },
  async mounted() {
    if (await this.fetchFirstData()) {
      await this.fetchStyle();
      // this.fetch();
      await this.storeMethod.fetchProduct();
      await this.storeMethod.fetchCarDetails();
    }
  },
  watch: {
    "store.state.model"() {
      this.fetchStyle();
    },
  },
  methods: {
    async fetchFirstData() {
      if (localStorage.getItem("email") && localStorage.getItem("password")) {
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
        if (
          this.store?.state?.user?.id_user &&
          this.store?.state?.user?.permission === "admin"
        ) {
          console.log("đã đăng nhập");
          return true;
        } else {
          this.$router.push("/admin/login");
          return false;
        }
      } else {
        this.$router.push("/admin/login");
        return false;
      }
    },
    // async fetch() {
    //   console.log("aaa");
    //   const { results } = await $fetch("/api/general/product", {
    //     method: "get",
    //     // body: { test: 123 },
    //   });
    //   console.log("results", results);
    //   this.product = results;
    // },
    fetchStyle() {
      // Chuyển tối
      if (this.store.state.model === true) {
        // màu chữ chung
        document.documentElement.style.setProperty(
          "--primary-color",
          "#d4d4d4"
        );
        this.store.style.primary_color = "#d4d4d4";
        document.documentElement.style.setProperty("--title-color", "#5ddcbf");
        document.documentElement.style.setProperty(
          "--background-color",
          "#000000"
        );
        document.documentElement.style.setProperty(
          "--sub-background-color",
          "#111111"
        );
        document.documentElement.style.setProperty(
          "--shadow-small-img",
          "#ffffff66"
        );

        // button
        this.store.style.ldp_btn_color = "#d4d4d4";
        this.store.style.title_color = "#5ddcbf";
      } else {
        // Chuyển sáng
        document.documentElement.style.setProperty(
          "--primary-color",
          "#424242"
        );
        this.store.style.primary_color = "#424242";
        document.documentElement.style.setProperty("--title-color", "#e32e2e");
        document.documentElement.style.setProperty(
          "--background-color",
          "#ffffff"
        );
        document.documentElement.style.setProperty(
          "--sub-background-color",
          "#ececec"
        );
        document.documentElement.style.setProperty(
          "--shadow-small-img",
          "#00000066"
        );

        // button
        this.store.style.ldp_btn_color = "#000000";
        this.store.style.title_color = "#e32e2e";
      }
    },
    // getListNavDraw(item) {
    //   this.layout.nav_draw_now.items = [];
    //   for (let i = 0; i < this.layout.nav_draw.items.length; i++) {
    //     if (item.id === this.layout.nav_draw.items[i].app_bar_id) {
    //       const tempItem = {
    //         id: this.layout.nav_draw.items[i].id,
    //         icon: this.layout.nav_draw.items[i].icon,
    //         title: this.layout.nav_draw.items[i].title,
    //         path: this.layout.nav_draw.items[i].path,
    //       };
    //       if (
    //         this.layout.nav_draw.items[i]?.permission &&
    //         this.layout.nav_draw.items[i].permission.length > 0
    //       ) {
    //         // for (
    //         //   let j = 0;
    //         //   j < this.layout.nav_draw.items[i].permission.length;
    //         //   j++
    //         // ) {
    //         //   if (
    //         //     this.layout.nav_draw.items[i].permission[j] ===
    //         //     this.store.data.user.permission
    //         //   ) {
    //         this.layout.nav_draw_now.items.push(tempItem);
    //         //   }
    //         // }
    //       } else {
    //         this.layout.nav_draw_now.items.push(tempItem);
    //       }
    //     }
    //   }
    //   console.log(this.layout.nav_draw_now);
    // },
  },
};
</script>

<style scoped>
.small-img {
  width: 15vw;
  border-radius: 5px;
  box-shadow: 0px 0px 15px var(--shadow-small-img);
}
.app-bar {
  background-color: rgba(0, 0, 0, 0.5);
  box-shadow: 5px 10px rgba(59, 202, 59, 0) !important;
  margin-bottom: 2vh;
}
.app-bar-title {
  font-weight: bold;
  vertical-align: middle;
}
.app-bar-item {
  color: rgb(0, 0, 0);
  font-family: "Times New Roman", Times, serif;
}
.app-bar-icon {
  display: block;
}
.v-toolbar__content,
.v-toolbar__extension {
  height: 5vw !important;
}
.card_style {
  display: flex;
  border-radius: 0;
  min-height: 100vh;
  /* margin-bottom: 3vw; */
}
.link_style {
  color: #fff;
  text-decoration: none;
}
.nav_btn_style {
  background: #ffffff00;
  margin: 0;
  text-align: left;
}
.footer_hr {
  border: none;
  background-color: red;
  height: 2px;
  width: 90%;
}
.text_hr {
  border: none;
  background-color: gray;
  height: 1px;
  width: 90%;
}
</style>