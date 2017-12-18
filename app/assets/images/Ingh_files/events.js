(function() {
  var EventpicCropper,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  jQuery(function() {
    return new EventpicCropper();
  });

  EventpicCropper = (function() {
    function EventpicCropper() {
      this.updatePreview = bind(this.updatePreview, this);
      $('#cropbox').Jcrop({
        aspectRatio: 1,
        setSelect: [0, 0, 600, 600],
        onSelect: this.update,
        onChange: this.update
      });
      ({
        update: (function(_this) {
          return function(coords) {};
        })(this)
      });
      $('#event_crop_x').val(coords.x);
      $('#event_crop_y').val(coords.y);
      $('#event_crop_w').val(coords.w);
      $('#event_crop_h').val(coords.h);
      this.updatePreview(coords);
    }

    EventpicCropper.prototype.updatePreview = function(coords) {
      return $('#preview').css({
        width: Math.round(100 / coords.w * $('#cropbox').width()) + 'px',
        height: Math.round(100 / coords.h * $('#cropbox').height()) + 'px',
        marginLeft: '-' + Math.round(100 / coords.w * coords.x) + 'px',
        marginTop: '-' + Math.round(100 / coords.h * coords.y) + 'px'
      });
    };

    return EventpicCropper;

  })();

}).call(this);
