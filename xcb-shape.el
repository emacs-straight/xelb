;;; xcb-shape.el --- X11 Shape extension  -*- lexical-binding: t -*-

;; Copyright (C) 2015-2024 Free Software Foundation, Inc.

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This file was generated by 'el_client.el' from 'shape.xml',
;; which you can retrieve from <git://anongit.freedesktop.org/xcb/proto>.

;;; Code:

(require 'xcb-types)

(defconst xcb:shape:-extension-xname "SHAPE")
(defconst xcb:shape:-extension-name "Shape")
(defconst xcb:shape:-major-version 1)
(defconst xcb:shape:-minor-version 1)

(require 'xcb-xproto)

(xcb:deftypealias 'xcb:shape:OP 'xcb:CARD8)

(xcb:deftypealias 'xcb:shape:KIND 'xcb:CARD8)

(defconst xcb:shape:SO:Set 0)
(defconst xcb:shape:SO:Union 1)
(defconst xcb:shape:SO:Intersect 2)
(defconst xcb:shape:SO:Subtract 3)
(defconst xcb:shape:SO:Invert 4)

(defconst xcb:shape:SK:Bounding 0)
(defconst xcb:shape:SK:Clip 1)
(defconst xcb:shape:SK:Input 2)

(defclass xcb:shape:Notify
  (xcb:-event)
  ((~code :initform 0)
   (shape-kind :initarg :shape-kind :type xcb:shape:KIND)
   (~sequence :type xcb:CARD16)
   (affected-window :initarg :affected-window :type xcb:WINDOW)
   (extents-x :initarg :extents-x :type xcb:INT16)
   (extents-y :initarg :extents-y :type xcb:INT16)
   (extents-width :initarg :extents-width :type xcb:CARD16)
   (extents-height :initarg :extents-height :type xcb:CARD16)
   (server-time :initarg :server-time :type xcb:TIMESTAMP)
   (shaped :initarg :shaped :type xcb:BOOL)
   (pad~0 :initform 11 :type xcb:-pad)))

(defclass xcb:shape:QueryVersion
  (xcb:-request)
  ((~opcode :initform 0 :type xcb:-u1)))
(defclass xcb:shape:QueryVersion~reply
  (xcb:-reply)
  ((pad~0 :initform 1 :type xcb:-pad)
   (~sequence :type xcb:CARD16)
   (length :type xcb:CARD32)
   (major-version :initarg :major-version :type xcb:CARD16)
   (minor-version :initarg :minor-version :type xcb:CARD16)))

(defclass xcb:shape:Rectangles
  (xcb:-request)
  ((~opcode :initform 1 :type xcb:-u1)
   (operation :initarg :operation :type xcb:shape:OP)
   (destination-kind :initarg :destination-kind :type xcb:shape:KIND)
   (ordering :initarg :ordering :type xcb:BYTE)
   (pad~0 :initform 1 :type xcb:-pad)
   (destination-window :initarg :destination-window :type xcb:WINDOW)
   (x-offset :initarg :x-offset :type xcb:INT16)
   (y-offset :initarg :y-offset :type xcb:INT16)
   (rectangles~ :initform
		'(name rectangles type xcb:RECTANGLE size nil)
		:type xcb:-list)
   (rectangles :initarg :rectangles :type xcb:-ignore)))

(defclass xcb:shape:Mask
  (xcb:-request)
  ((~opcode :initform 2 :type xcb:-u1)
   (operation :initarg :operation :type xcb:shape:OP)
   (destination-kind :initarg :destination-kind :type xcb:shape:KIND)
   (pad~0 :initform 2 :type xcb:-pad)
   (destination-window :initarg :destination-window :type xcb:WINDOW)
   (x-offset :initarg :x-offset :type xcb:INT16)
   (y-offset :initarg :y-offset :type xcb:INT16)
   (source-bitmap :initarg :source-bitmap :type xcb:PIXMAP)))

(defclass xcb:shape:Combine
  (xcb:-request)
  ((~opcode :initform 3 :type xcb:-u1)
   (operation :initarg :operation :type xcb:shape:OP)
   (destination-kind :initarg :destination-kind :type xcb:shape:KIND)
   (source-kind :initarg :source-kind :type xcb:shape:KIND)
   (pad~0 :initform 1 :type xcb:-pad)
   (destination-window :initarg :destination-window :type xcb:WINDOW)
   (x-offset :initarg :x-offset :type xcb:INT16)
   (y-offset :initarg :y-offset :type xcb:INT16)
   (source-window :initarg :source-window :type xcb:WINDOW)))

(defclass xcb:shape:Offset
  (xcb:-request)
  ((~opcode :initform 4 :type xcb:-u1)
   (destination-kind :initarg :destination-kind :type xcb:shape:KIND)
   (pad~0 :initform 3 :type xcb:-pad)
   (destination-window :initarg :destination-window :type xcb:WINDOW)
   (x-offset :initarg :x-offset :type xcb:INT16)
   (y-offset :initarg :y-offset :type xcb:INT16)))

(defclass xcb:shape:QueryExtents
  (xcb:-request)
  ((~opcode :initform 5 :type xcb:-u1)
   (destination-window :initarg :destination-window :type xcb:WINDOW)))
(defclass xcb:shape:QueryExtents~reply
  (xcb:-reply)
  ((pad~0 :initform 1 :type xcb:-pad)
   (~sequence :type xcb:CARD16)
   (length :type xcb:CARD32)
   (bounding-shaped :initarg :bounding-shaped :type xcb:BOOL)
   (clip-shaped :initarg :clip-shaped :type xcb:BOOL)
   (pad~1 :initform 2 :type xcb:-pad)
   (bounding-shape-extents-x :initarg :bounding-shape-extents-x :type xcb:INT16)
   (bounding-shape-extents-y :initarg :bounding-shape-extents-y :type xcb:INT16)
   (bounding-shape-extents-width :initarg :bounding-shape-extents-width :type xcb:CARD16)
   (bounding-shape-extents-height :initarg :bounding-shape-extents-height :type xcb:CARD16)
   (clip-shape-extents-x :initarg :clip-shape-extents-x :type xcb:INT16)
   (clip-shape-extents-y :initarg :clip-shape-extents-y :type xcb:INT16)
   (clip-shape-extents-width :initarg :clip-shape-extents-width :type xcb:CARD16)
   (clip-shape-extents-height :initarg :clip-shape-extents-height :type xcb:CARD16)))

(defclass xcb:shape:SelectInput
  (xcb:-request)
  ((~opcode :initform 6 :type xcb:-u1)
   (destination-window :initarg :destination-window :type xcb:WINDOW)
   (enable :initarg :enable :type xcb:BOOL)
   (pad~0 :initform 3 :type xcb:-pad)))

(defclass xcb:shape:InputSelected
  (xcb:-request)
  ((~opcode :initform 7 :type xcb:-u1)
   (destination-window :initarg :destination-window :type xcb:WINDOW)))
(defclass xcb:shape:InputSelected~reply
  (xcb:-reply)
  ((enabled :initarg :enabled :type xcb:BOOL)
   (~sequence :type xcb:CARD16)
   (length :type xcb:CARD32)))

(defclass xcb:shape:GetRectangles
  (xcb:-request)
  ((~opcode :initform 8 :type xcb:-u1)
   (window :initarg :window :type xcb:WINDOW)
   (source-kind :initarg :source-kind :type xcb:shape:KIND)
   (pad~0 :initform 3 :type xcb:-pad)))
(defclass xcb:shape:GetRectangles~reply
  (xcb:-reply)
  ((ordering :initarg :ordering :type xcb:BYTE)
   (~sequence :type xcb:CARD16)
   (length :type xcb:CARD32)
   (rectangles-len :initarg :rectangles-len :type xcb:CARD32)
   (pad~0 :initform 20 :type xcb:-pad)
   (rectangles~ :initform
		'(name rectangles type xcb:RECTANGLE size
		       (xcb:-fieldref 'rectangles-len))
		:type xcb:-list)
   (rectangles :initarg :rectangles :type xcb:-ignore)))

(defconst xcb:shape:event-number-class-alist
  '((0 . xcb:shape:Notify))
  "(event-number . event-class) alist.")



(provide 'xcb-shape)

;;; xcb-shape.el ends here
