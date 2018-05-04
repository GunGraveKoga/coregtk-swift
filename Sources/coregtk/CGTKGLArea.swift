/*
 * CGTKGLArea.swift
 * This file is part of CoreGTK
 *
 * Copyright (C) 2017 - Tyler Burton
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

/*
 * Modified by the CoreGTK Team, 2016. See the AUTHORS file for a
 * list of people on the CoreGTK Team.
 * See the ChangeLog files for a list of changes.
 *
 */

@_exported import CGtk

public let GTK_TYPE_GL_AREA: GType = gtk_gl_area_get_type()

@inline(__always) public func GTK_GL_AREA(_ ptr: UnsafeMutableRawPointer!) -> UnsafeMutablePointer<GtkGLArea>! {
	return G_TYPE_CHECK_INSTANCE_CAST(ptr, GTK_TYPE_GL_AREA)
}

/// 
/// #GtkGLArea is a widget that allows drawing with OpenGL.
/// #GtkGLArea sets up its own #GdkGLContext for the window it creates, and
/// creates a custom GL framebuffer that the widget will do GL rendering onto.
/// It also ensures that this framebuffer is the default GL rendering target
/// when rendering.
/// In order to draw, you have to connect to the #GtkGLArea::render signal,
/// or subclass #GtkGLArea and override the @GtkGLAreaClass.render() virtual
/// function.
/// The #GtkGLArea widget ensures that the #GdkGLContext is associated with
/// the widget's drawing area, and it is kept updated when the size and
/// position of the drawing area changes.
/// ## Drawing with GtkGLArea ##
/// The simplest way to draw using OpenGL commands in a #GtkGLArea is to
/// create a widget instance and connect to the #GtkGLArea::render signal:
/// |[<!-- language="C" -->
/// // create a GtkGLArea instance
/// GtkWidget *gl_area = gtk_gl_area_new ();
/// // connect to the "render" signal
/// g_signal_connect (gl_area, "render", G_CALLBACK (render), NULL);
/// ]|
/// The `render()` function will be called when the #GtkGLArea is ready
/// for you to draw its content:
/// |[<!-- language="C" -->
/// static gboolean
/// render (GtkGLArea *area, GdkGLContext *context)
/// {
/// // inside this function it's safe to use GL; the given
/// // #GdkGLContext has been made current to the drawable
/// // surface used by the #GtkGLArea and the viewport has
/// // already been set to be the size of the allocation
/// // we can start by clearing the buffer
/// glClearColor (0, 0, 0, 0);
/// glClear (GL_COLOR_BUFFER_BIT);
/// // draw your object
/// draw_an_object ();
/// // we completed our drawing; the draw commands will be
/// // flushed at the end of the signal emission chain, and
/// // the buffers will be drawn on the window
/// return TRUE;
/// }
/// ]|
/// If you need to initialize OpenGL state, e.g. buffer objects or
/// shaders, you should use the #GtkWidget::realize signal; you
/// can use the #GtkWidget::unrealize signal to clean up. Since the
/// #GdkGLContext creation and initialization may fail, you will
/// need to check for errors, using gtk_gl_area_get_error(). An example
/// of how to safely initialize the GL state is:
/// |[<!-- language="C" -->
/// static void
/// on_realize (GtkGLarea *area)
/// {
/// // We need to make the context current if we want to
/// // call GL API
/// gtk_gl_area_make_current (area);
/// // If there were errors during the initialization or
/// // when trying to make the context current, this
/// // function will return a #GError for you to catch
/// if (gtk_gl_area_get_error (area) != NULL)
/// return;
/// // You can also use gtk_gl_area_set_error() in order
/// // to show eventual initialization errors on the
/// // GtkGLArea widget itself
/// GError *internal_error = NULL;
/// init_buffer_objects (&error);
/// if (error != NULL)
/// {
/// gtk_gl_area_set_error (area, error);
/// g_error_free (error);
/// return;
/// }
/// init_shaders (&error);
/// if (error != NULL)
/// {
/// gtk_gl_area_set_error (area, error);
/// g_error_free (error);
/// return;
/// }
/// }
/// ]|
/// If you need to change the options for creating the #GdkGLContext
/// you should use the #GtkGLArea::create-context signal.


open class CGTKGLArea : CGTKWidget {
	/// 
	/// Creates a new #GtkGLArea widget.
	/// - Returns: CGTKWidget
	public convenience init() {
		self.init(withGObject: gtk_gl_area_new())!
	}

	open var GLAREA: UnsafeMutablePointer<GtkGLArea>! {
		get {
			return GTK_GL_AREA(self.GOBJECT)
		}
	}

	/// 
	/// Ensures that the @area framebuffer object is made the current draw
	/// and read target, and that all the required buffers for the @area
	/// are created and bound to the frambuffer.
	/// This function is automatically called before emitting the
	/// #GtkGLArea::render signal, and doesn't normally need to be called
	/// by application code.
	open func gtkGlAreaAttachBuffers() {
		gtk_gl_area_attach_buffers(GTK_GL_AREA(self.GOBJECT))
	}

	/// 
	/// Returns whether the area is in auto render mode or not.
	/// - Returns: Bool
	open func gtkGlAreaGetAutoRender() -> Bool {
		return gtk_gl_area_get_auto_render(GTK_GL_AREA(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Retrieves the #GdkGLContext used by @area.
	/// - Returns: OpaquePointer
	open func gtkGlAreaGetContext() -> OpaquePointer {
		return gtk_gl_area_get_context(GTK_GL_AREA(self.GOBJECT))
	}

	/// 
	/// Gets the current error set on the @area.
	/// - Returns: UnsafeMutablePointer<GError>?
	open func gtkGlAreaGetError() -> UnsafeMutablePointer<GError>? {
		return gtk_gl_area_get_error(GTK_GL_AREA(self.GOBJECT))
	}

	/// 
	/// Returns whether the area has an alpha component.
	/// - Returns: Bool
	open func gtkGlAreaGetHasAlpha() -> Bool {
		return gtk_gl_area_get_has_alpha(GTK_GL_AREA(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns whether the area has a depth buffer.
	/// - Returns: Bool
	open func gtkGlAreaGetHasDepthBuffer() -> Bool {
		return gtk_gl_area_get_has_depth_buffer(GTK_GL_AREA(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Returns whether the area has a stencil buffer.
	/// - Returns: Bool
	open func gtkGlAreaGetHasStencilBuffer() -> Bool {
		return gtk_gl_area_get_has_stencil_buffer(GTK_GL_AREA(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Retrieves the required version of OpenGL set
	/// using gtk_gl_area_set_required_version().
	/// Parameters:
	///	- major: UnsafeMutablePointer<Int32>!
	///	- minor: UnsafeMutablePointer<Int32>!
	open func gtkGlAreaGetRequiredVersion(major: UnsafeMutablePointer<Int32>!, minor: UnsafeMutablePointer<Int32>!) {
		gtk_gl_area_get_required_version(GTK_GL_AREA(self.GOBJECT), major, minor)
	}

	/// 
	/// Retrieves the value set by gtk_gl_area_set_use_es().
	/// - Returns: Bool
	open func gtkGlAreaGetUseEs() -> Bool {
		return gtk_gl_area_get_use_es(GTK_GL_AREA(self.GOBJECT)) != 0 ? true : false
	}

	/// 
	/// Ensures that the #GdkGLContext used by @area is associated with
	/// the #GtkGLArea.
	/// This function is automatically called before emitting the
	/// #GtkGLArea::render signal, and doesn't normally need to be called
	/// by application code.
	open func gtkGlAreaMakeCurrent() {
		gtk_gl_area_make_current(GTK_GL_AREA(self.GOBJECT))
	}

	/// 
	/// Marks the currently rendered data (if any) as invalid, and queues
	/// a redraw of the widget, ensuring that the #GtkGLArea::render signal
	/// is emitted during the draw.
	/// This is only needed when the gtk_gl_area_set_auto_render() has
	/// been called with a %FALSE value. The default behaviour is to
	/// emit #GtkGLArea::render on each draw.
	open func gtkGlAreaQueueRender() {
		gtk_gl_area_queue_render(GTK_GL_AREA(self.GOBJECT))
	}

	/// 
	/// If @auto_render is %TRUE the #GtkGLArea::render signal will be
	/// emitted every time the widget draws. This is the default and is
	/// useful if drawing the widget is faster.
	/// If @auto_render is %FALSE the data from previous rendering is kept
	/// around and will be used for drawing the widget the next time,
	/// unless the window is resized. In order to force a rendering
	/// gtk_gl_area_queue_render() must be called. This mode is useful when
	/// the scene changes seldomly, but takes a long time to redraw.
	/// Parameters:
	///	- autoRender: Bool
	open func gtkGlAreaSetAutoRender(_ autoRender: Bool) {
		gtk_gl_area_set_auto_render(GTK_GL_AREA(self.GOBJECT), autoRender ? 1 : 0)
	}

	/// 
	/// Sets an error on the area which will be shown instead of the
	/// GL rendering. This is useful in the #GtkGLArea::create-context
	/// signal if GL context creation fails.
	/// Parameters:
	///	- error: UnsafePointer<GError>?
	open func gtkGlAreaSetError(_ error: UnsafePointer<GError>?) {
		gtk_gl_area_set_error(GTK_GL_AREA(self.GOBJECT), error)
	}

	/// 
	/// If @has_alpha is %TRUE the buffer allocated by the widget will have
	/// an alpha channel component, and when rendering to the window the
	/// result will be composited over whatever is below the widget.
	/// If @has_alpha is %FALSE there will be no alpha channel, and the
	/// buffer will fully replace anything below the widget.
	/// Parameters:
	///	- hasAlpha: Bool
	open func gtkGlAreaSetHasAlpha(_ hasAlpha: Bool) {
		gtk_gl_area_set_has_alpha(GTK_GL_AREA(self.GOBJECT), hasAlpha ? 1 : 0)
	}

	/// 
	/// If @has_depth_buffer is %TRUE the widget will allocate and
	/// enable a depth buffer for the target framebuffer. Otherwise
	/// there will be none.
	/// Parameters:
	///	- hasDepthBuffer: Bool
	open func gtkGlAreaSetHasDepthBuffer(_ hasDepthBuffer: Bool) {
		gtk_gl_area_set_has_depth_buffer(GTK_GL_AREA(self.GOBJECT), hasDepthBuffer ? 1 : 0)
	}

	/// 
	/// If @has_stencil_buffer is %TRUE the widget will allocate and
	/// enable a stencil buffer for the target framebuffer. Otherwise
	/// there will be none.
	/// Parameters:
	///	- hasStencilBuffer: Bool
	open func gtkGlAreaSetHasStencilBuffer(_ hasStencilBuffer: Bool) {
		gtk_gl_area_set_has_stencil_buffer(GTK_GL_AREA(self.GOBJECT), hasStencilBuffer ? 1 : 0)
	}

	/// 
	/// Sets the required version of OpenGL to be used when creating the context
	/// for the widget.
	/// This function must be called before the area has been realized.
	/// Parameters:
	///	- major: gint
	///	- minor: gint
	open func gtkGlAreaSetRequiredVersion(major: gint, minor: gint) {
		gtk_gl_area_set_required_version(GTK_GL_AREA(self.GOBJECT), major, minor)
	}

	/// 
	/// Sets whether the @area should create an OpenGL or an OpenGL ES context.
	/// You should check the capabilities of the #GdkGLContext before drawing
	/// with either API.
	/// Parameters:
	///	- useEs: Bool
	open func gtkGlAreaSetUseEs(_ useEs: Bool) {
		gtk_gl_area_set_use_es(GTK_GL_AREA(self.GOBJECT), useEs ? 1 : 0)
	}

}
