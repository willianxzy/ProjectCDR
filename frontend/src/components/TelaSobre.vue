
<script setup>
import SobreItem from "./SobreItem.vue";
import DocumentationIcon from "./icons/IconDocumentation.vue";
</script>

<template>
  <SobreItem class="n1">
    <template #icon>
      <DocumentationIcon />
    </template>
    <template #heading>Sobre Nós</template>
    <div>
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
      <img src="../assets/LogoCDRGreen.png" alt="">
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

  .item.n1 img {
    width: 100px;
    height: 100px;

    float: right;
  }

  .details h3 {
    color: black;
  }
</style>
