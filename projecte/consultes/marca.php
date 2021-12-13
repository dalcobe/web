<?php
  $connexio = new mysqli ("localhost", "root", "Alastor666Radio", "electroimp");
?>
<!DOCTYPE html>
<html lang="ca" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Filtrar Productes (Ordenat per Marca)</title>
    <link rel="stylesheet" href="../css/generics.css">
    <link rel="stylesheet" href="../css/nav.css">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/taula.css">
  </head>
  <body>
    <header>
      <h1>Botiga de components</h1>
    </header>
    <nav>
      <ul>
        <li><a href="../index.html">Pàgina d'Inici</a></li>
        <li><a href="../placa_base/inici.html">Placa Base</a></li>
        <li><a href="../cpu/inici.html">Processadors</a></li>
        <li><a href="../ram/inici.html">Memòria RAM</a></li>
        <li><a href="../disc_dur/inici.html">Disc Durs</a></li>
        <li><a href="../connexio.php">Filtrar Productes</a></li>
      </ul>
    </nav>
    <main>
      <h2 class="subtitol">Filtrar per Plaques Bases</h2>
      <div class="taula_centrada">
        <table>
          <tr>
            <th>
              Codi Producte
            </th>
            <th>
              Marca
            </th>
            <th>
              Model
            </th>
            <th>
              Estoc
            </th>
            <th>
              Categoria
            </th>
            <th>
              Material
            </th>
          </tr>
          <?php
          $sql="SELECT * from productes,categoria,fet where productes.codi_cat=categoria.codi_cat and productes.codi_prod=fet.codi_prod  order by marca";
          $result=mysqli_query($connexio,$sql);
          while ($mostrar=mysqli_fetch_array($result)) {
            ?>
            <tr>
              <td><?php echo $mostrar['codi_prod']; ?></td>
              <td><?php echo $mostrar['marca']; ?></td>
              <td><?php echo $mostrar['model']; ?></td>
              <td><?php echo $mostrar['estoc']; ?></td>
              <td><?php echo $mostrar['nom']; ?></td>
              <td><?php echo $mostrar['nom2']; ?></td>
            </tr>
          <?php
          }
          ?>
        </table>
      </div>
    </main>
  </body>
</html>
