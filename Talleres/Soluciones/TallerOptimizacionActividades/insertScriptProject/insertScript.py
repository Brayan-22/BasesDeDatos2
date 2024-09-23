import random
from lorem_text import lorem
import psycopg2
password = "12345"

#basicos para tabla Responsable
nombres = [
 'Jaime', 'Miguel', 'Carla', 'Guillermo', 'Lola', 'Carmen', 'Marina', 'Laura', 'Eduardo', 'Joaquín',
 'Miguel', 'José', 'Joaquín', 'Ana', 'Laura', 'Miriam', 'Pablo', 'Ricardo', 'Aitana', 'Diego',
 'Eugenia', 'Laura', 'Beatriz', 'Pedro', 'Iris', 'Eva', 'Marcos', 'Daniel', 'Rafael', 'Gonzalo',
 'Verónica', 'Diego', 'Esther', 'Carmen', 'Hugo', 'Felipe', 'Adriana', 'Óscar', 'Alberto', 'Amparo',
 'Javier', 'Esther', 'Eva', 'Martín', 'Cristóbal', 'Isabel', 'Eva', 'Martín', 'Silvia', 'María',
 'Beatriz', 'Mónica', 'Iván', 'Laura', 'David', 'Natalia', 'Enrique', 'Cristóbal', 'Miguel', 'Nicolás',
 'Carmen', 'Sara', 'Eugenia', 'Margarita', 'Leandro', 'María', 'Miriam', 'Elsa', 'Antonio', 'Gonzalo',
 'Ricardo', 'Sandra', 'Eduardo', 'Cristóbal', 'Sonia', 'Javier', 'Claudia', 'Vicente', 'Jaime',
 'Guillermo', 'Juan', 'Pilar', 'Vicente', 'Samuel', 'Raquel', 'Emilio', 'Jesús', 'Iván', 'Aitana',
 'Jaime', 'Sebastián', 'Raquel', 'Daniel', 'Daniela', 'Diego', 'Lola', 'Tomás', 'Elena', 'María', 'Tomás'
]
apellidos = [
 'Muñoz', 'Arenas', 'Martínez', 'García', 'Ribera', 'Cano', 'Gutiérrez', 'León', 'Luna', 'Velasco',
 'Ortiz', 'Martínez', 'García', 'Vicente', 'Rey', 'Delgado', 'Pascual', 'León', 'Medina', 'Acosta',
 'Sanz', 'Cruz', 'Acosta', 'Cruz', 'Martín', 'Iglesias', 'Alonso', 'Nieto', 'Herrera', 'Lara',
 'Márquez', 'Paredes', 'Castillo', 'Lozano', 'Guerra', 'Morales', 'Alonso', 'Martín', 'Gil', 'Gallardo',
 'Domínguez', 'Benítez', 'Soler', 'Ribera', 'Vidal', 'Márquez', 'Santos', 'Luna', 'Lorenzo', 'Acosta',
 'Rivas', 'Santos', 'Ortiz', 'Moreno', 'Aguilar', 'Gallardo', 'Díaz', 'Gómez', 'Ramos', 'Rojas',
 'Bravo', 'Mora', 'Vicente', 'Navarro', 'Ruiz', 'Méndez', 'García', 'Muñoz', 'Carrasco', 'Beltrán',
 'Rivas', 'Gil', 'Cruz', 'Carrasco', 'Segura', 'Vargas', 'Montes', 'Román', 'Gallardo', 'Rubio',
 'Moreno', 'Álvarez', 'Benítez', 'Acosta', 'Camacho', 'Garrido', 'Vargas', 'Blanco', 'Iglesias', 'Rojas',
 'Ortega', 'Mora', 'Román', 'Carrasco', 'Blanco', 'Benítez', 'Morales', 'Esteban', 'Parra', 'Alonso'
]
actividades_descripciones = {
    "Recolección de requisitos": "Proceso de obtención y documentación de las necesidades y expectativas de los stakeholders para definir los requisitos del sistema.",
    "Análisis de requisitos": "Evaluación y especificación detallada de los requisitos para asegurarse de que estén completos, claros y sin ambigüedades.",
    "Diseño del sistema": "Creación de la estructura del sistema, definiendo la arquitectura y los componentes necesarios para cumplir con los requisitos.",
    "Diseño de la arquitectura": "Desarrollo de una visión de alto nivel de la estructura del sistema, incluyendo la definición de componentes y sus interacciones.",
    "Diseño de la base de datos": "Diseño de la estructura y relaciones de las tablas y datos necesarios para el almacenamiento y la recuperación eficiente de la información.",
    "Desarrollo del backend": "Implementación de la lógica de negocio y la funcionalidad del servidor, incluyendo la conexión a bases de datos y la gestión de la comunicación con el frontend.",
    "Desarrollo del frontend": "Creación de la interfaz de usuario y experiencia de usuario (UI/UX), incluyendo la implementación de elementos visuales y la interacción con el backend.",
    "Integración de APIs": "Conexión de servicios externos mediante interfaces de programación de aplicaciones (APIs) para intercambiar datos y funcionalidades entre sistemas.",
    "Pruebas unitarias": "Ejecución de pruebas para verificar que cada unidad individual del código (funciones, métodos, clases) funciona correctamente.",
    "Pruebas de integración": "Verificación de que diferentes módulos o componentes del sistema funcionen correctamente juntos y cumplan con los requisitos.",
    "Pruebas de regresión": "Ejecución de pruebas para asegurar que los cambios en el código no introduzcan nuevos errores o afecten negativamente a funcionalidades existentes.",
    "Revisión de código": "Inspección del código fuente por parte de otros desarrolladores para identificar errores, mejorar la calidad y asegurar el cumplimiento de estándares.",
    "Optimización del rendimiento": "Ajuste y mejora del sistema para aumentar su eficiencia y velocidad, reduciendo el tiempo de respuesta y el uso de recursos.",
    "Refactorización de código": "Proceso de reestructuración del código para mejorar su claridad, mantenibilidad y estructura sin cambiar su comportamiento funcional.",
    "Documentación del código": "Creación de documentación técnica para describir el funcionamiento del código, facilitando su comprensión y mantenimiento.",
    "Documentación del sistema": "Elaboración de documentación para el sistema en general, incluyendo manuales de usuario, guías de instalación y especificaciones técnicas.",
    "Despliegue en ambiente de pruebas": "Instalación y configuración del sistema en un entorno de pruebas para realizar validaciones y pruebas previas al despliegue en producción.",
    "Despliegue en producción": "Implementación del sistema en el entorno de producción, haciéndolo disponible para los usuarios finales.",
    "Monitorización del sistema": "Seguimiento continuo del sistema en producción para asegurar su funcionamiento correcto y detectar posibles problemas o anomalías.",
    "Mantenimiento del sistema": "Realización de ajustes y actualizaciones al sistema para corregir errores, mejorar funcionalidades o adaptarse a cambios en el entorno.",
    "Gestión de errores y fallos (bug fixing)": "Identificación, análisis y corrección de errores o fallos en el sistema para asegurar su correcto funcionamiento.",
    "Reuniones de planificación (sprint planning)": "Sesiones de planificación en las que el equipo define los objetivos y tareas para el próximo sprint o ciclo de desarrollo.",
    "Revisión de sprints": "Evaluación al final de un sprint para revisar el trabajo realizado, identificar mejoras y ajustar el plan para el próximo sprint.",
    "Reuniones diarias (daily stand-ups)": "Reuniones cortas diarias en las que el equipo discute el progreso, los problemas y los objetivos del día.",
    "Gestión de versiones": "Control y seguimiento de diferentes versiones del software para asegurar una correcta evolución y despliegue de las actualizaciones.",
    "Gestión de configuraciones": "Control de las configuraciones del sistema y del entorno para garantizar una correcta implementación y mantenimiento del software.",
    "Automatización de pruebas": "Uso de herramientas y scripts para ejecutar pruebas automáticamente, reduciendo el esfuerzo manual y aumentando la cobertura de pruebas.",
    "Automatización de despliegue (CI/CD)": "Implementación de procesos de integración continua y despliegue continuo para automatizar la construcción, prueba y despliegue del software.",
    "Revisión y aprobación de cambios": "Proceso de revisión de solicitudes de cambio en el software, asegurando que sean válidas, necesarias y aprobadas antes de su implementación.",
    "Capacitación del usuario final": "Entrenamiento y soporte para los usuarios finales para garantizar que puedan utilizar el sistema de manera efectiva.",
    "Gestión de cambios en los requisitos": "Proceso de manejo y adaptación de cambios en los requisitos del proyecto, asegurando que se gestionen adecuadamente y se implementen de manera controlada.",
    "Análisis de impacto de cambios": "Evaluación de cómo los cambios en el software afectan al sistema en su conjunto, incluyendo sus componentes y la interacción con otros sistemas.",
    "Análisis de seguridad": "Evaluación de las vulnerabilidades del sistema y la implementación de medidas para proteger la información y los recursos contra amenazas y ataques.",
    "Revisión de diseño": "Inspección del diseño del sistema para asegurar que cumple con los requisitos y estándares de calidad antes de su implementación.",
    "Gestión de proyectos": "Planificación, ejecución y supervisión de todas las actividades relacionadas con el desarrollo del software para cumplir con los objetivos del proyecto.",
    "Control de calidad": "Proceso de asegurar que el software cumple con los estándares y requisitos de calidad establecidos, mediante pruebas y revisiones sistemáticas.",
    "Auditoría del código": "Evaluación detallada del código fuente para verificar su calidad, seguridad y cumplimiento con los estándares y buenas prácticas.",
    "Evaluación post-mortem del proyecto": "Revisión y análisis del proyecto después de su finalización para identificar lecciones aprendidas y áreas de mejora para futuros proyectos."
}

cargos = [
 'Administrador de Redes', 'Arquitecto de Aplicaciones', 'Consultor de Negocios', 'Desarrollador Frontend',
 'Ingeniero de Procesos', 'Tester', 'Product Owner', 'Analista de Negocios', 'Analista de Arquitectura',
 'Gerente de IT', 'Consultor Técnico', 'Especialista en Cloud', 'Arquitecto de Aplicaciones', 'Desarrollador de Chatbots',
 'Consultor DevOps', 'Gerente de IT', 'Desarrollador de Blockchain', 'Administrador de Base de Datos', 'Consultor Técnico',
 'Ingeniero de Redes', 'Administrador de Redes', 'Especialista en Virtualización', 'Desarrollador de Videojuegos',
 'Especialista en Gestión de Requisitos', 'Especialista en Bases de Datos', 'Ingeniero de Infraestructura',
 'Especialista en Gestión de Requisitos', 'Líder Técnico', 'Desarrollador Móvil', 'Administrador de Redes',
 'Director de Tecnología', 'Analista de Pruebas', 'Diseñador UX/UI', 'Coordinador de Proyectos', 'Gerente de Producto',
 'Administrador de Redes', 'Consultor de IT', 'Especialista en Cloud', 'Consultor de Negocios', 'Desarrollador de Chatbots',
 'Especialista en Gestión de Requisitos', 'Gerente de IT', 'Consultor de Seguridad', 'Arquitecto de Aplicaciones',
 'Especialista en UX', 'Ingeniero de Virtualización', 'Coordinador de Desarrollo', 'Desarrollador Móvil',
 'Desarrollador de Blockchain', 'Gerente de Innovación', 'Desarrollador de Software Embebido', 'Desarrollador de Microservicios',
 'Desarrollador de APIs', 'Desarrollador de APIs', 'Desarrollador de Blockchain', 'Gerente de IT', 'Coordinador de Desarrollo',
 'Diseñador UX/UI', 'Desarrollador de Microservicios', 'Gerente de Producto', 'Ingeniero de Datos', 'Arquitecto de Aplicaciones',
 'Especialista en UX', 'Consultor de IT', 'Ingeniero de Mantenimiento de Software', 'Coordinador de Seguridad',
 'Desarrollador Backend', 'Diseñador Gráfico', 'Gerente de Proyecto', 'Ingeniero de Automatización de Pruebas',
 'Tester Automatizado', 'Gerente de Innovación', 'Administrador de Base de Datos', 'Scrum Master', 'Scrum Master',
 'Analista de Negocios', 'Desarrollador de APIs', 'Ingeniero de Soporte', 'Especialista en Gestión de Requisitos',
 'Analista de Sistemas', 'Coordinador de Proyectos', 'Consultor de Seguridad', 'Desarrollador Full Stack',
 'Desarrollador Backend', 'Desarrollador de Software Embebido', 'Líder de Equipo de Desarrollo', 'Gerente de IT',
 'Ingeniero de Datos', 'Especialista en Integración', 'Ingeniero de Infraestructura', 'Desarrollador de Microservicios',
 'Consultor Técnico', 'Consultor de IT', 'Consultor DevOps', 'Consultor Técnico', 'Ingeniero de Aplicaciones',
 'Desarrollador Backend', 'Desarrollador de Inteligencia Artificial', 'Desarrollador de Chatbots', 'Consultor de Negocios'
]
tipo_inconveniente = ["bajo","medio","fuerte"]
personas = [(i,random.choice(nombres), random.choice(apellidos),random.choice(cargos)[:25]) for i in range(1,4000)]

try:
    coneccion = psycopg2.connect(
        user='postgres',
        password=password,
        host='localhost',
        port=5432,
        database='postgres'
    )
    cursor = coneccion.cursor()
    print("Si conecto")

    #DESCOMENTAR ESTO SI NO ESTA LLENA LA TABLA TIPOINCONVENIENTE
    #insertar tipo inconveniente
    '''
    insertar_tipo_inconveniente ="""
    insert into tipo_inconveniente(id_tipoinconveniente,tipo_impacto) values 
    (%s,%s)
    """
    tipos_inconvenientes = [(indice+1,valor) for indice,valor in enumerate(tipo_inconveniente)]
    cursor.executemany(insertar_tipo_inconveniente, tipos_inconvenientes)
    '''


    #Insertar personas
    insertar_personas = """
    INSERT INTO responsable
     (id_responsable,nombre_responsable, apellido_responsable,cargo_responsable)
    VALUES (%s, %s,%s,%s)
    """
    cursor.executemany(insertar_personas, personas)
    coneccion.commit()
    #Insertar actividades
    id_min = """
    select min(id_responsable) from responsable;"""
    id_max = """
    select max(id_responsable) from responsable ;"""
    cursor.execute(id_min)
    min_persona = cursor.fetchone()[0]
    cursor.execute(id_max)
    max_persona = cursor.fetchone()[0]

    insertar_actividades = """
    insert into actividad(id_actividad,id_responsable,nombre_actividad,descripcion,horas_planeadas) values
    (%s,%s,%s,%s,%s)
    """
    ##actividades_insert = [(i,random.choice(actividades),fake.text(max_nb_chars=40),random.randint(2,18))for i in range(min_persona,max_persona)]
    personas_aleatorias = [random.randint(min_persona,max_persona) for i in range(1,4000)]
    actividades_insert = [
        (
            i,
            personas_aleatorias[i-1],
            actividad[:20],
            actividades_descripciones[actividad][:50],
            random.randint(6, 24)
        )
        for i in range(min_persona, max_persona)
        for actividad in [random.choice(list(actividades_descripciones.keys()))]
    ]
    cursor.executemany(insertar_actividades, actividades_insert)
    coneccion.commit()
    ##Fin insert activdades
    ##Inicio insert progreso
    insert_progresos= """
    insert into progreso(id_progreso,id_actividad,desc_progreso,tiempo_ejecutado)values
    (%s,%s,%s,%s)
    """
    id_min_act = """
    select min(id_actividad) from actividad a;"""
    id_max_act = """
    select max(id_actividad) from actividad a ;"""
    cursor.execute(id_min_act)
    min_actividad = cursor.fetchone()[0]
    cursor.execute(id_max_act)
    max_actividad = cursor.fetchone()[0]
    progreso_insert1 = [(1,ind,lorem.paragraph()[:15],random.randint(1,3)) for ind in range(min_actividad, max_actividad)]
    progreso_insert2 = [(2,ind,lorem.paragraph()[:15],random.randint(1,3)) for ind in range(min_actividad, max_actividad)]
    cursor.executemany(insert_progresos, progreso_insert1)
    coneccion.commit()
    cursor.executemany(insert_progresos, progreso_insert2)
    coneccion.commit()
    ##Fin insert avances
    ##insertar inconvenientes
    insert_inconvenientes = """
    insert into inconveniente(id_actividad,id_progreso,id_inconveniente,id_tipoinconveniente,desc_inconveniente)values
    (%s,%s,%s,%s,%s)
    """
    inconvenientes_insert = [(i,1,2*i,random.randint(1,3),lorem.paragraph()[:15])for i in range(min_actividad, max_actividad)]
    inconvenientes_insert = [(i,2,2*i+1,random.randint(1,3),lorem.paragraph()[:15])for i in range(min_actividad, max_actividad)]
    cursor.executemany(insert_inconvenientes, inconvenientes_insert)
    coneccion.commit()
    ##Fin inserts inconvenientes
except Exception as e:
    print("Error de conexion",e)
finally:
    if coneccion:
        cursor.close()
        coneccion.close()
        print("Conexion cerrada")