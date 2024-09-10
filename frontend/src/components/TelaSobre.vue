
<script setup>
import SobreItem from "./SobreItem.vue";
import DocumentationIcon from "./icons/IconDocumentation.vue";
</script>

<template>
  <SobreItem class="n1">
    <template #icon>
      <DocumentationIcon />
    </template>
    <template #heading><strong>Sobre Nós</strong></template>
    <div class="content">
      <div class="content-left">
        <p>
          Bem-vindo ao Sítio Ana Júlia! Somos uma empresa familiar dedicada à produção
          de delícias caseiras, localizada em Paraju, Domingos Martins - ES. Fundada
          por Júlio José e Aldézia, nosso compromisso é oferecer produtos
          autênticos, feitos com ingredientes frescos e naturais, sem conservantes
          ou corantes.
        </p> 
        <br>
        <p>
          Nossa linha de produtos inclui vinhos artesanais, capelettis
          frescos, geléias deliciosas, licores exclusivos e crocantes chips de
          banana. Cada item é produzido com amor e dedicação, respeitando as
          tradições culinárias da nossa família e a sustentabilidade. No Canto da
          Roça, você encontra mais do que produtos; encontra a essência da nossa
          paixão pela gastronomia.
        </p>
        <br>
        <p>
          Venha conhecer e se encantar com os sabores
          genuínos que nos tornam únicos!
        </p>
      </div>
      <div class="content-right">
        <img src="../assets/sitioAnaJulia.png" alt="">
      </div>
    </div>
  </SobreItem>
</template>

<style scoped>
  .item.n1 p {
    color: black;
    font-family: Inter;
    font-size: 25px;
    text-align: justify;
  }

  .details h3 {
    color: black;
  }

  .content {
    width: 1500px;
    height: 450px;
    display: flex;
    align-items: center;
    justify-content: space-between;
  }

  .content-right img{
    position: absolute;
    right: 0;
    top: 50%;
    transform: translateY(-50%);
    margin-right: 20px;
  }

  .content-left {
    flex: 1;
    margin-right: 300px;
  }

    /* Telas médias (tablets) */
@media (max-width: 1024px) {
  body{
    min-width: auto;
    width: auto;
  }
}
/* Telas pequenas (smartphones) */
@media (max-width: 768px) {
  body{
    min-width: auto;
    width: auto;
  }
}

/* Ajustes para telas extra pequenas (até 480px) */
@media (max-width: 480px) {
  body{
    min-width: auto;
    width: auto;
  }

  .content{
    display: flex;
    flex-direction: column;
    
    height: auto;
    width: 480px;

    margin: 0px 30px 0px 30px;
  }

  .content-left {
    margin-right: 0px;
  }

  .content-right img {
    display: flex;
    position: relative;
    margin-right: 0px;
  }
  
}
</style>
