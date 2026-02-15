# SGCM – Prototipo de Alta Fidelidad en Ruby (Sinatra)
# Ejecutar con: ruby app.rb

require 'sinatra'
require 'sinatra/reloader' if development?

set :bind, '0.0.0.0'
set :port, 4567

get '/' do
  redirect '/inicio'
end

get '/:vista' do
  @vista = params[:vista]
  erb :layout
end

__END__

@@layout
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>SGCM – Sistema de Gestión de Citas Médicas</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <style>
    body { margin:0; font-family: Arial; background:#f4f6f8; }
    header { background:#1976d2; color:#fff; padding:12px 20px; display:flex; justify-content:space-between; }
    .layout { display:flex; min-height: calc(100vh - 56px); }
    nav { width:220px; background:#fff; border-right:1px solid #ddd; }
    nav a { display:block; padding:12px 16px; color:#333; text-decoration:none; }
    nav a.active, nav a:hover { background:#1976d2; color:#fff; }
    main { flex:1; padding:24px; }
    .card { background:#fff; padding:20px; border-radius:6px; max-width:600px; }
    input { width:100%; padding:8px; margin:6px 0; }
    button { padding:10px 16px; border:none; border-radius:4px; }
    .primary { background:#2e7d32; color:#fff; }
    table { width:100%; border-collapse:collapse; background:#fff; }
    th, td { padding:10px; border-bottom:1px solid #ddd; }
    footer { text-align:center; padding:12px; font-size:13px; color:#555; }
  </style>
</head>
<body>

<header>
  <strong>SGCM – Sistema de Gestión de Citas Médicas</strong>
  <span>Superusuario</span>
</header>

<div class="layout">
  <nav>
    <a href="/inicio" class="<%= 'active' if @vista=='inicio' %>">Inicio</a>
    <a href="/medicos" class="<%= 'active' if @vista=='medicos' %>">Médicos</a>
    <a href="/pacientes" class="<%= 'active' if @vista=='pacientes' %>">Pacientes</a>
    <a href="/citas" class="<%= 'active' if @vista=='citas' %>">Citas</a>
    <a href="/historial" class="<%= 'active' if @vista=='historial' %>">Historial médico</a>
    <a href="/reportes" class="<%= 'active' if @vista=='reportes' %>">Reportes</a>
    <a href="/configuracion" class="<%= 'active' if @vista=='configuracion' %>">Configuración</a>
    <a href="/salir">Salir</a>
  </nav>

  <main>
    <% if @vista == 'inicio' %>
      <h2>Bienvenido al SGCM</h2>
      <p>Seleccione una opción del menú para comenzar.</p>

    <% elsif @vista == 'medicos' %>
      <div class="card">
        <h2>Registrar Médico</h2>
        <input placeholder="Nombres" />
        <input placeholder="Apellidos" />
        <input placeholder="Especialidad" />
        <input placeholder="Correo electrónico" />
        <button class="primary">Guardar</button>
      </div>

    <% elsif @vista == 'pacientes' %>
      <div class="card">
        <h2>Registrar Paciente</h2>
        <input placeholder="Nombres" />
        <input placeholder="Apellidos" />
        <input type="date" />
        <input placeholder="Correo electrónico" />
        <button class="primary">Guardar</button>
      </div>

    <% elsif @vista == 'citas' %>
      <h2>Citas Médicas</h2>
      <table>
        <thead>
          <tr><th>Fecha</th><th>Hora</th><th>Paciente</th><th>Médico</th></tr>
        </thead>
        <tbody>
          <tr><td>25/04/2025</td><td>09:00</td><td>Ana López</td><td>Dr. Martínez</td></tr>
        </tbody>
      </table>

    <% elsif @vista == 'historial' %>
      <h2>Historial Médico</h2>
      <div class="card">
        <p><strong>Paciente:</strong> Ana López</p>
        <p><strong>Diagnóstico:</strong> Hipertensión</p>
        <p><strong>Tratamiento:</strong> Control mensual</p>
      </div>

    <% elsif @vista == 'reportes' %>
      <h2>Reportes</h2>
      <div class="card">
        <p>Reporte de citas por médico</p>
        <p>Reporte de citas por fecha</p>
        <button class="primary">Generar reporte</button>
      </div>

    <% elsif @vista == 'configuracion' %>
      <h2>Configuración</h2>
      <div class="card">
        <input value="SGCM" />
        <input value="admin@sgcm.com" />
        <button class="primary">Guardar cambios</button>
      </div>

    <% elsif @vista == 'salir' %>
      <h2>Sesión finalizada</h2>
      <p>Gracias por usar el sistema SGCM.</p>
    <% end %>
  </main>
</div>

<footer>
  Sistema de Gestion Citas Medicas © 2026
</footer>

</body>
</html>