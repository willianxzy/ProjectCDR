<script setup>
import { RouterLink, RouterView } from "vue-router";
</script>

<template>
  <header>
    <div class="header">
      <img src="./assets/logoCDR.png">
      <nav>
        <RouterLink to="/">Home</RouterLink>
        <RouterLink to="/about">Sobre</RouterLink>
        <RouterLink to="/produtos">Produtos</RouterLink>
      </nav>
    </div>
  </header>

  <main>
    <RouterView></RouterView>
  </main>

  <footer class="footer">
    <div class="footer-content">
      <div class="footer-left">
        <p> Contato:
          <a href="https://api.whatsapp.com/send/?phone=%2B5527995839399&text&type=phone_number&app_absent=0" target="_blank" class="contact-link"><i class="bi bi-whatsapp">(27) 99583-9399</i></a>
        | <a href="https://www.instagram.com/canto.da.roca/" target="_blank" class="contact-link"><i class="bi bi-instagram">@canto.da.roca</i></a></p>
      </div>
      <div class="footer-right">
        <p>&copy; 2024 Sítio Ana Júlia. Todos os direitos reservados.</p>
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
  position: relative;
  width: 100%;
  height: 100px;
  padding: 20px 0;

  flex-shrink: 0;

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
    flex-wrap: wrap;
    padding: 0 20px;
}

.footer-left {
  flex: 1 1 auto; 
  text-align: left; 
}

.footer-right {
  flex: 0 1 auto; 
  text-align: right; 
  margin-bottom: 10px;
}

.footer-right a {

  border-radius: 5px;
  padding: 2px;
  color: white;
}

.footer-right p{
  font-size: 18px;
  margin: 0;
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

main {
  padding-bottom: 120px;
}


/* Tablets e telas intermediárias */
@media (max-width: 1024px) {
  img {
    width: 150px;
    height: 150px;
  }

  .header {
    flex-direction: column;
    text-align: center;
  }

  nav {
    justify-content: center;
    gap: 15px;
  }

  .footer p {
    font-size: 13px;
  }
}

/* Smartphones e telas pequenas */
@media (max-width: 768px) {
  img {
    width: 100px;
    height: 100px;
  }

  .header {
    flex-direction: row;
    text-align: left;
  }

  nav {
    flex-direction: column;
    gap: 10px;
    margin: 0;
  }

  .footer {
    flex-direction: column;
    text-align: center;
    width: 768px;
  }

  .footer-left, .footer-right {
    text-align: center;
  }

  .footer p {
    font-size: 12px;
  }
}

@media (max-width: 480px) {
  .template {
    width: 480px;
  }

  header{
    width: 480px;
    flex-direction: row;
    text-align: left;
  }

  main{
    width: 480px;
  }
  
  img {
    width: 80px;
    height: 80px;
    margin-left: 10px;
  }

  nav {
    padding: 0px;
    flex-direction: row;
    width: 430px;
    gap: 2px;
  }

  nav a {
    font-size: 0.8rem;
    padding: 5px;

  }

  .footer {
    flex-direction: column;
    text-align: center;
    width: 480px;
  }

  .footer p {
    font-size: 10px;
  }
}
</style>
