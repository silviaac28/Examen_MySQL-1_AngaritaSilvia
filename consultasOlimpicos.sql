use olimpicosDB;

-- 1. Consulta de Todos los Eventos en un Complejo Deportivo Específico.

-- ESTA CONSULTA MUESTRA TODOS LOS EVENTOS EN COMPLEJO DEPORTIVO ZAPATOCA --

select cd.nombre as NombreComplejo, ecd.id_evento_complejo_deportivo as IdEvento, e.fecha as FechaEvento
from evento_complejo_deportivo ecd inner join complejo_deportivo cd
on cd.id_complejo_deportivo = ecd.id_complejo inner join eventos e 
on ecd.id_evento = e.id_evento where cd.nombre = 'Complejo Deportivo Zapatoca';

-- 2. Consulta de Comisarios Asignados a un Evento en Particular.

-- ESTA CONSULTA MUESTRA COMISARIOS ASIGNADOS A EVENTO TORNEO DE TENIS --

select c.id_comisario as IDComisario, c.nombre as NombreComisario, ec.id_evento as IDEvento, e.nombre as NombreEvento
from comisario c inner join evento_comisario ec 
on c.id_comisario = ec.id_comisario inner JOIN eventos e
on ec.id_evento = e.id_evento where e.nombre = 'Torneo de Tennis';


-- 3. Consulta de Todos los Eventos en un Rango de Fechas.

--- ESTA CONSULTA MUESTRA TODOS LOS EVENTOS OCURRIDOS UNICAMENTE EN EL 2024

Select e.nombre as NombreEvento, e.fecha as FechaEvento, e.duracion as DuracionEvento
from eventos e where DATE_FORMAT(e.fecha, '%Y') = '2024';


-- 4. Consulta del Número Total de Comisarios Asignados a Eventos.

select ec.id_evento as IDEvento, e.nombre as NombreEvento, count(c.id_comisario) as NumeroComisariosAsignados
from comisario c inner join evento_comisario ec 
on c.id_comisario = ec.id_comisario inner JOIN eventos e
on ec.id_evento = e.id_evento
GROUP by ec.id_evento;

-- 5. Consulta de Complejos Polideportivos con Área Total Ocupada Superior a un Valor Específico.

-- ESTA CONSULTA MUESTRA COMPLEJOS POLIDEPORTIVOS CON AREA TOTAL SUPERIOR A 5----

select cp.id_complejo_polideportivo as ID, cp.nombre as NombreComplejo, ic.area_complejo as AreaComplejo
from complejo_polideportivo cp inner join info_complejo ic 
on cp.id_info_complejo = ic.id_complejo
having ic.area_complejo > 5;


-- 6. Consulta de Eventos con Número de Participantes Mayor que la Media.

select e.nombre as NombreEvento, e.num_participantes as NumeroParticipantes from eventos e 
where e.num_participantes > (SELECT AVG(e.num_participantes) from eventos e2);




-- 7. Consulta de Equipamiento Necesario para un Evento Específico.

-- ESTA CONSULTA MUESTRA EQUIPAMIENTO NECESARIO PARA TORNEO DE NATACION--

select ee.id_evento as IDEvento, e2.nombre as NombreEvento, e.nombre_equipos as NombreEquipamientoNecesario
from equipamento e inner join evento_equipo ee 
on e.id_equipamento = ee.id_equipamiento inner join eventos e2 
on ee.id_evento = e2.id_evento where e2.nombre = 'Torneo de Natacion';

-- 8. Consulta de Eventos Celebrados en Complejos Deportivos con Jefe de Organización Específico.

-- CONSULTA EVENTOS CON JEFE ESPECIFICO ANA ROJAS--

select ecd.id_evento_complejo_deportivo  as IDEventoComplejoCelebrado , j.nombre as NombreJefe
from evento_complejo_deportivo ecd inner join complejo_deportivo cd 
on ecd.id_complejo = cd.id_complejo_deportivo inner join info_complejo ic 
on cd.id_info_complejo = ic.id_complejo inner join jefes j 
on ic.id_jefe = j.id_jefe where j.nombre = 'Ana Rojas';

-- 9. Consulta de Complejos Polideportivos sin Eventos Celebrados.

select cp.id_complejo_polideportivo as IDComplejoPolideportivo, cp.nombre as NombrePolideportivo
from complejo_polideportivo cp inner join evento_complejo_poli ecp 
on cp.id_complejo_polideportivo = ecp.id_complejo 
where ecp.id_complejo != cp.id_complejo_polideportivo;


-- 10. Consulta de Comisarios que Actúan como Jueces en Todos los Eventos.

select c.nombre as NombreComisario, c.tipo as "Rol en eventos"
from comisario c inner join evento_comisario ec 
on c.id_comisario = ec.id_evento_comisario
where c.tipo = 'juez' ;
