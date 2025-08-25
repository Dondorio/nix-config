{
  # Enable the uinput module
  boot.kernelModules = ["uinput"];

  # Enable uinput
  hardware.uinput.enable = true;

  # Set up udev rules for uinput
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';

  # Ensure the uinput group exists
  users.groups.uinput = {};

  # Add the Kanata service user to necessary groups
  systemd.services.kanata-internalKeyboard.serviceConfig = {
    SupplementaryGroups = [
      "input"
      "uinput"
    ];
  };

  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
          "/dev/input/by-id/usb-USB_Keyboard_USB_Keyboard-event-kbd"
        ];
        extraDefCfg = "process-unmapped-keys yes";
        config =
          # lisp
          ''
            ;; (defsrc
            ;;  caps a s d f j k l ;
            ;; )
            (defvar
            tap-time 150
            hold-time 200
            )
            (defalias
            cap (tap-hold $tap-time $hold-time esc lctl)
            a (tap-hold $tap-time $hold-time a lmet)
            s (tap-hold $tap-time $hold-time s lalt)
            d (tap-hold $tap-time $hold-time d lsft)
            f (tap-hold $tap-time $hold-time f lctl)
            j (tap-hold $tap-time $hold-time j rctl)
            k (tap-hold $tap-time $hold-time k rsft)
            l (tap-hold $tap-time $hold-time l ralt)
            ; (tap-hold $tap-time $hold-time ; rmet)

            a2 (tap-hold $tap-time $hold-time a lmet)
            r2 (tap-hold $tap-time $hold-time r lalt)
            s2 (tap-hold $tap-time $hold-time s lsft)
            t2 (tap-hold $tap-time $hold-time t lctl)
            n2 (tap-hold $tap-time $hold-time n rctl)
            e2 (tap-hold $tap-time $hold-time e rsft)
            i2 (tap-hold $tap-time $hold-time i ralt)
            o2 (tap-hold $tap-time $hold-time o rmet)
            qwr (layer-switch qwerty)
            cmk (layer-switch colemak-dh)
            spc (tap-hold $tap-time $hold-time spc (layer-while-held space-fn))
            )

            ;;(deflayer base
            ;; @caps @a  @s  @d  @f  @j  @k  @l  @;
            ;;)
            (defsrc
            grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
            caps a    s    d    f    g    h    j    k    l    ;    '    ret
            lsft z    x    c    v    b    n    m    ,    .    /    rsft
            lctl lmet lalt           spc            ralt rmet rctl
            )

            (deflayer colemak-dh
            @qwr 1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab  q    w    f    p    b    j    l    u    y    ;    [    ]    \
            @cap @a2  @r2  @s2  @t2  g    m    @n2  @e2  @i2  @o2  '    ret
            lsft z    x    c    d    v    k    h    ,    .    /    rsft
            lctl lmet lalt           @spc           ralt rmet rctl
            )

            (deflayer qwerty
            @cmk 1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
            esc  a    s    d    f    g    h    j    k    l    ;    '    ret
            lsft z    x    c    v    b    n    m    ,    .    /    rsft
            lctl lmet lalt           spc            ralt rmet rctl
            )

            (deflayer space-fn
            grv  S-1  S-2  S-3  S-4  S-5  S-6  S-7  S-8  S-9  S-0  _    +    bspc
            tab  -    -    -    -    -    -    S-.  -    S-,  -    -    -    -
            caps S-9  S-0  S-[  S-]  S-6  left down up   rght =    \    ret
            lsft S-1  S-8  [    ]    grv  S-=  S-'  '    S-7  S-\  rsft
            lctl lmet lalt           spc            ralt rmet rctl
            )

          '';
      };
    };
  };
}
