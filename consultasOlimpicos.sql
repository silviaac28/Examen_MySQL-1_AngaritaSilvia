use olimpicosDB;

-- 1. Consulta de Todos los Eventos en un Complejo Deportivo Específico.

select ecd.id_evento_complejo_deportivo as IdEvento, ecd.id_complejo as IDComplejo, cd.nombre as NombreComplejo, e.fecha as FechaEvento
from evento_complejo_deportivo ecd inner join complejo_deportivo cd
on cd.id_complejo_deportivo = ecd.id_complejo inner join eventos e 
on ecd.id_evento = e.id_evento;

-- 2. Consulta de Comisarios Asignados a un Evento en Particular.
-- 3. Consulta de Todos los Eventos en un Rango de Fechas.
-- 4. Consulta del Número Total de Comisarios Asignados a Eventos.
-- 5. Consulta de Complejos Polideportivos con Área Total Ocupada Superior a un Valor Específico.
-- 6. Consulta de Eventos con Número de Participantes Mayor que la Media.
-- 7. Consulta de Equipamiento Necesario para un Evento Específico.
-- 8. Consulta de Eventos Celebrados en Complejos Deportivos con Jefe de Organización Específico.
-- 9. Consulta de Complejos Polideportivos sin Eventos Celebrados.
-- 10. Consulta de Comisarios que Actúan como Jueces en Todos los Eventos.