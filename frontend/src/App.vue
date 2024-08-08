<script setup>
import { RouterLink, RouterView } from "vue-router";
</script>

<template>
  <header>
    <div class="header">
      <img src="./assets/LogoCDR.png" alt="" />
      <nav>
        <RouterLink to="/">Home</RouterLink>
        <RouterLink to="/about">Sobre</RouterLink>
        <RouterLink to="/produtos">Produtos</RouterLink>
        <!--<RouterLink to="/municipios">Municípios</RouterLink>
        <RouterLink to="/estados">Estados</RouterLink>
        <RouterLink to="/formas-pagamento">Formas de Pagamento</RouterLink>
        <RouterLink to="/Clientes">Clientes</RouterLink>
        <RouterLink to="/pedidos">Pedidos</RouterLink>-->
      </nav>
    </div>
  </header>

  <main>
    <RouterView />
  </main>

  <footer class="footer">
    <div class="footer-content">
      <div class="footer-left">
        <p>&copy; 2024 Sítio Ana Júlia. Todos os direitos reservados.</p>
      </div>
      <div class="footer-right">
        <p> Contato:
          <a href="https://api.whatsapp.com/send/?phone=%2B5527995839399&text&type=phone_number&app_absent=0" target="_blank" class="contact-link"><i class="bi bi-whatsapp">(27) 99583-9399</i></a>
        | <a href="https://www.instagram.com/canto.da.roca/" target="_blank" class="contact-link"><i class="bi bi-instagram">@canto.da.roca</i></a></p>
      </div>
    </div>
  </footer>
</template>

<style scoped>
img {
  width: 175px;
  height: 175px;
  margin: auto;
  margin-left: 100px;
  display: inline-flex;
  border-radius: 100%;
}

.header {
  margin-top: 20px;
}

nav {
  text-align: left;
  font-size: 1rem;

  padding: 1rem 0;
  border-radius: 11px;

  display: inline-flex;
  width: 80%;

  justify-content: flex-end;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

.wrapper nav {
  width: 100%;
  font-size: 12px;
  text-align: left;
}

nav a.router-link-exact-active {
  background-color: #426B1F;
  color: white;
}

nav a.router-link-exact-active:hover {
  background-color: #426B1F;
  color: white;
}

nav a {
  margin: 2px;
  display: inline-block;
  padding: 0.5rem;
  border-left: 1px solid var(--color-text);
  color: rgb(0, 0, 0);
  border-radius: 5px;
  font-family: Inter;
}

nav a:first-of-type {
  border: 0;
}

.footer {
  display: flex;

  bottom: 0;
  position: fixed;
  width: 100%;

  height: 100px;

  color: white;
  background-color: #426B1F;
}

.footer p {
  font-size: 15px;
  font-family: Inter;

  padding: 0 1rem 0;

  width: auto;
  margin: auto;
  float: left;
}

.footer-content {
    display: flex;
    width: 100%;
    justify-content: space-between;
    align-items: center;
}

.footer-right a {

  border-radius: 5px;
  padding: 2px;
  color: white;
}

.footer-right p{
  font-size: 18px;
}

.bi.bi-whatsapp::before {
  margin-right: 3px;
}

.bi.bi-instagram::before {
  margin-left: 5px;
  margin-right: 5px;
}

.contact-link {
    color: #fff;
    font-weight: bold;
    text-decoration: none;
    padding: 5px;
    border-radius: 5px;
    transition: background-color 0.3s, color 0.3s;
}

.contact-link:hover {
    background-color: #fff;
    color: #4CAF50;
}

.contact-link i {
    margin-right: 5px;
}

@media (max-width: 1024px) {
  .logo {
    margin: 0 2rem 0 0;
  }

  img {
    width: 150px;
    height: 150px;
  }
}
</style>
