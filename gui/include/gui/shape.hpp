#pragma once

#include <QObject>
#include <QtConcurrent>
#include <QOpenGLVertexArrayObject>
#include <QOpenGLBuffer>
#include <QOpenGLFunctions>

#include "ao/tree/tree.hpp"
#include "ao/format/mesh.hpp"

class Shape : public QObject, QOpenGLFunctions
{
    Q_OBJECT
public:
    Shape(Kernel::Tree t);

    /*  Constructs OpenGL objects as needed  */
    void draw(const QMatrix4x4& M);

    /*
     *  Kicks off a mesh rendering operation in a separate thread
     */
    void startRender();

signals:
    void gotMesh();

protected slots:
    void onFutureFinished();

protected:
    Kernel::Mesh* renderMesh();
    QFuture<Kernel::Mesh*> mesh_future;
    QFutureWatcher<Kernel::Mesh*> mesh_watcher;

    Kernel::Tree tree;
    QScopedPointer<Kernel::Mesh> mesh;

    bool gl_ready=false;
    QOpenGLVertexArrayObject vao;
    QOpenGLBuffer vbo;
};
