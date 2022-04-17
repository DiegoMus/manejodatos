drop TABLE usuario;
CREATE TABLE `usuario` (
  `idusuario` int,
  `nombre` varchar(13),
  `apellido` varchar(13),
  `cui` varchar(13),
  `nota1` int,
  `nota2` int,
  `nota3` int,
  `nota4` int 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO usuario (idusuario,nombre,apellido,cui,nota1,nota2,nota3,nota4) values (1, 'Diego', 'Mus', '1670149271601', 100, 100, 100, 100);
INSERT INTO usuario (idusuario,nombre,apellido,cui,nota1,nota2,nota3,nota4) values (2, 'Jorge', 'San José', '1670149271602', 100, 100, 100, 100);