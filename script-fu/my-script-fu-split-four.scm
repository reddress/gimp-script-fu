;; when run on existing image collage of four photos, split at center point and
;; save into four separate files

;; also create split vertically and split horizontally later

;; NAINAI_001 -> NAINAI_001A, 001B, 001C, 001D

(define (script-fu-split-quad img drawable)
  ;; select top left
  ;; paste as new image
  ;; save

  (let* (
         (original-filename (gimp-image-get-filename img))
         (img-width (car (gimp-drawable-width drawable)))
         (img-height (car (gimp-drawable-height drawable)))
         (target-width (inexact->exact (floor (/ img-width 2))))
         (target-height (inexact->exact (floor (/ img-height 2)))))
    
    (gimp-rect-select
     img 0 0
     ;;     (inexact->exact (floor (/ img-width 2)))
     ;;     (inexact->exact (floor (/ img-height 2)))
     target-width target-height
     REPLACE 0 0)

    (gimp-edit-copy drawable)

    (let* (
           (top-left (car (gimp-edit-paste-as-new))))
      (gimp-image-set-filename top-left "TopLeft")
      (gimp-display-new top-left))
    

    )
  )

(script-fu-register "script-fu-split-quad"
                    "Split Quad"
                    "Splits image into four pieces"
                    "Heitor Chang"
                    "Heitor Chang"
                    "2014-10-05"
                    "RGB*, GRAY*"
                    SF-IMAGE "Input image" 0
                    SF-DRAWABLE "Input drawable" 0)
(script-fu-menu-register "script-fu-split-quad"
                         "<Image>/Script-Fu/Split")
