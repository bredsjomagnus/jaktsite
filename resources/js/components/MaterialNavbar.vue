<template>
  <mdb-navbar expand="large" dark color="stylish">
    <mdb-navbar-brand href="#">
      Navbar
    </mdb-navbar-brand>
    <mdb-navbar-toggler>
      <mdb-navbar-nav>
        <mdb-nav-item
        v-for="(item, index) in links"
        v-bind:item="item"
        v-bind:index="index"
        v-bind:key="item.id"
        :href="getRoute(item.route)"
      >{{item.text}}</mdb-nav-item>

        <!-- <mdb-nav-item href="#" active>Home</mdb-nav-item>
        <mdb-nav-item href="login">Logga in</mdb-nav-item>
        <mdb-nav-item class="disabled" href="#">Disabled</mdb-nav-item>
        <mdb-dropdown tag="li" class="nav-item">
          <mdb-dropdown-toggle tag="a" navLink color="stylish" slot="toggle" waves-fixed>Dropdown</mdb-dropdown-toggle>
          <mdb-dropdown-menu>
            <mdb-dropdown-item>Action</mdb-dropdown-item>
            <mdb-dropdown-item>Another action</mdb-dropdown-item>
            <mdb-dropdown-item>Something else here</mdb-dropdown-item>
          </mdb-dropdown-menu>
        </mdb-dropdown> -->
      </mdb-navbar-nav>
    </mdb-navbar-toggler>
  </mdb-navbar>
</template>
<script>
  import { mdbDropdown, mdbDropdownToggle, mdbDropdownMenu, mdbDropdownItem, mdbContainer, mdbNavbar, mdbNavbarBrand, mdbNavbarToggler, mdbNavbarNav, mdbNavItem } from 'mdbvue';
  export default {
    name: 'HelloWorld',
    components: {
      mdbNavbar,
      mdbNavbarBrand,
      mdbNavbarToggler,
      mdbNavbarNav,
      mdbNavItem,
      mdbContainer,
      mdbDropdown,
      mdbDropdownToggle,
      mdbDropdownMenu,
      mdbDropdownItem
    },
    data() {
      return {
        links: [
          {
            text: "Hem",
            route: "home",
            // route: "/www/jaktsite/public/home",
            active: "active"
          },
          {
            text: "Logga in",
            route: "login",
            // route: "/www/jaktsite/public/login",
            active: ""
          },

        ]
      }
    },
    methods: {
      getRoute(path) {
        axios.get('api/user').then(response => {
          console.log(response.body);
        });
        console.log(base_url);
        return base_url + "/" + path;
        
      }
    }
  }
</script>