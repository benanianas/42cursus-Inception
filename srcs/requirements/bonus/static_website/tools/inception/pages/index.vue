<template>
<div class="cnt">
  <a href="https://abenani.42.fr" target="_blank"><div class="btn">Wordpress</div></a>
  <a href="https://adminer.abenani.42.fr" target="_blank"><div class="btn">Adminer</div></a>
  <a href="http://localhost:9000" target="_blank"><div class="btn">CAdvisor</div></a>
  <a href="https://github.com/benanianas/42cursus-Inception" target="_blank"><div class="btn">Project's Repo</div></a>
</div>
</template>

<script>
export default {
  name: 'IndexPage'
}
</script>
<style>
body{
  margin: 0px;
}
.cnt{
  height: 100vh;
  background: url('@/static/1337.jpeg');
  background-size: cover;
  text-align: center;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  align-items: center;
}
.btn{
  color: #000;
  font-size: 1.5rem;
  font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
  width: 200px;
  background-color: #a3de83;
  border-radius: 4px;
  padding: 15px 30px;
  margin: auto;
  transition: background-color 1s;
}
.btn:hover{
  cursor: pointer;
  background-color: #f9f9f9;
}
a{
  text-decoration: none;
  width: 200px;
}
</style>
