INSERT INTO `mydb`.`racas` (`id_animal`, `raca`, `sintomas`, `origem`, `tipo`, `porte`) VALUES ('1', 'vira-lata', 'inconsciente', '1', '1', 'pequeno');
INSERT INTO `mydb`.`racas` (`id_animal`, `raca`, `sintomas`, `origem`, `tipo`, `porte`) VALUES ('2', 'chow-chow', 'vomitando', '1', '1', 'médio');

INSERT INTO `mydb`.`usuarios` (`id_usuario`, `nome`, `telefone`, `cpf`, `email`, `senha`, `categoria`, `clinica_id_clinica`) VALUES ('1', 'Alzemiro Iago', '51981848145', '0340550', 'teste@teste.com', '12345', '1', '');
INSERT INTO `mydb`.`usuarios` (`id_usuario`, `nome`, `telefone`, `cpf`, `email`, `senha`, `categoria`, `clinica_id_clinica`) VALUES ('2', 'Giovane', '51981847777', '0340550', 'teste2@teste', '12547', '2', '1');

INSERT INTO `mydb`.`veterinarios` (`id_veterinario`, `crmv`, `nome`, `disponibilidade`) VALUES ('1', '7685', 'Vinicius Almeida', '0');
INSERT INTO `mydb`.`veterinarios` (`id_veterinario`, `crmv`, `nome`, `disponibilidade`) VALUES ('2', '6548', 'Marco Polo', '1');

INSERT INTO `mydb`.`animais_identificados` (`usuario_id_usuario`, `animal_id_animal`, `localizacao`, `sintoma`, `ong_id_ong`) VALUES ('1', '1', '-29.6925281,-52.4360288,15z', 'Engasgo', '2');
INSERT INTO `mydb`.`animais_identificados` (`usuario_id_usuario`, `animal_id_animal`, `localizacao`, `sintoma`, `ong_id_ong`) VALUES ('2', '2', '-29.7265001,-52.440223,15z', 'Vomito', '1');

INSERT INTO `mydb`.`atendimentos` (`id_atendimento`, `descricao`, `animais_identificados_usuario_id_usuario`, `animais_identificados_animal_id_animal`, `animais_identificados_ong_id_ong`, `clinica_id_clinica`) VALUES ('1', 'Animal engasgado', '1', '1', '1', '1');
INSERT INTO `mydb`.`atendimentos` (`id_atendimento`, `descricao`, `animais_identificados_usuario_id_usuario`, `animais_identificados_animal_id_animal`, `animais_identificados_ong_id_ong`, `clinica_id_clinica`) VALUES ('2', 'Animal desmaiado', '2', '2', '2', '2');

INSERT INTO `mydb`.`clinicas` (`id_clinica`, `cnpj`, `localizacao`, `status_atendimento`) VALUES ('1', '12345789', 'Rua Tristao fagundes 256', '1');

INSERT INTO `mydb`.`clinicas_veterinarios` (`clinica_id_clinica`, `veterinario_id_veterinario`) VALUES ('1', '1');

INSERT INTO `mydb`.`ong_has_clinica` (`ong_id_ong`, `clinica_id_clinica`) VALUES ('1', '1');

INSERT INTO `mydb`.`ongs` (`id_ong`, `nome`, `localizacao`) VALUES ('1', 'Amigos Pet', ' R. João Goulart, 165 - Campestre, Lajeado - RS, 95900-000');
