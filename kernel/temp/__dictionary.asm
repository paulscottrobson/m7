; ----------------------------------------
    db    6
    db    FirstCodePage
    dw    def_21
    db    1
    db    "!"
; ----------------------------------------
    db    6
    db    FirstCodePage
    dw    def_2a
    db    1
    db    "*"
; ----------------------------------------
    db    6
    db    FirstCodePage
    dw    def_2b
    db    1
    db    "+"
; ----------------------------------------
    db    7
    db    FirstCodePage
    dw    def_2b_21
    db    2
    db    "+!"
; ----------------------------------------
    db    7
    db    FirstCodePage
    dw    def_2b_2b
    db    2
    db    "++"
; ----------------------------------------
    db    8
    db    FirstCodePage
    dw    def_2b_2b_2b
    db    3
    db    "+++"
; ----------------------------------------
    db    6
    db    FirstCodePage
    dw    def_2c
    db    1
    db    ","
; ----------------------------------------
    db    6
    db    FirstCodePage
    dw    def_2d
    db    1
    db    "-"
; ----------------------------------------
    db    7
    db    FirstCodePage
    dw    def_2d_2d
    db    2
    db    "--"
; ----------------------------------------
    db    8
    db    FirstCodePage
    dw    def_2d_2d_2d
    db    3
    db    "---"
; ----------------------------------------
    db    6
    db    FirstCodePage
    dw    def_2f
    db    1
    db    "/"
; ----------------------------------------
    db    7
    db    FirstCodePage
    dw    def_30_2d
    db    2
    db    "0-"
; ----------------------------------------
    db    7
    db    FirstCodePage
    dw    def_30_3c
    db    2
    db    "0<"
; ----------------------------------------
    db    7
    db    FirstCodePage
    dw    def_30_3d
    db    2
    db    "0="
; ----------------------------------------
    db    8
    db    FirstCodePage
    dw    def_31_36_2a
    db    3
    db    "16*"
; ----------------------------------------
    db    7
    db    FirstCodePage
    dw    def_32_2a
    db    2
    db    "2*"
; ----------------------------------------
    db    7
    db    FirstCodePage
    dw    def_32_2f
    db    2
    db    "2/"
; ----------------------------------------
    db    7
    db    FirstCodePage
    dw    def_34_2a
    db    2
    db    "4*"
; ----------------------------------------
    db    7
    db    FirstCodePage
    dw    def_34_2f
    db    2
    db    "4/"
; ----------------------------------------
    db    7
    db    FirstCodePage
    dw    def_38_2a
    db    2
    db    "8*"
; ----------------------------------------
    db    6
    db    FirstCodePage
    dw    def_3b
    db    1
    db    ";"
; ----------------------------------------
    db    6
    db    FirstCodePage
    dw    def_3c
    db    1
    db    "<"
; ----------------------------------------
    db    6
    db    FirstCodePage
    dw    def_3d
    db    1
    db    "="
; ----------------------------------------
    db    6
    db    FirstCodePage
    dw    def_40
    db    1
    db    "@"
; ----------------------------------------
    db    8
    db    FirstCodePage
    dw    def_61_3e_62
    db    3
    db    "a>b"
; ----------------------------------------
    db    8
    db    FirstCodePage
    dw    def_61_3e_63
    db    3
    db    "a>c"
; ----------------------------------------
    db    8
    db    FirstCodePage
    dw    def_61_3e_72
    db    3
    db    "a>r"
; ----------------------------------------
    db    9
    db    FirstCodePage
    dw    def_61_62_3e_72
    db    4
    db    "ab>r"
; ----------------------------------------
    db    10
    db    FirstCodePage
    dw    def_61_62_63_3e_72
    db    5
    db    "abc>r"
; ----------------------------------------
    db    8
    db    FirstCodePage
    dw    def_61_62_73
    db    3
    db    "abs"
; ----------------------------------------
    db    8
    db    FirstCodePage
    dw    def_61_6e_64
    db    3
    db    "and"
; ----------------------------------------
    db    8
    db    FirstCodePage
    dw    def_62_3e_61
    db    3
    db    "b>a"
; ----------------------------------------
    db    8
    db    FirstCodePage
    dw    def_62_3e_63
    db    3
    db    "b>c"
; ----------------------------------------
    db    8
    db    FirstCodePage
    dw    def_62_3e_72
    db    3
    db    "b>r"
; ----------------------------------------
    db    10
    db    FirstCodePage
    dw    def_62_73_77_61_70
    db    5
    db    "bswap"
; ----------------------------------------
    db    7
    db    FirstCodePage
    dw    def_63_21
    db    2
    db    "c!"
; ----------------------------------------
    db    7
    db    FirstCodePage
    dw    def_63_2c
    db    2
    db    "c,"
; ----------------------------------------
    db    8
    db    FirstCodePage
    dw    def_63_3e_61
    db    3
    db    "c>a"
; ----------------------------------------
    db    8
    db    FirstCodePage
    dw    def_63_3e_62
    db    3
    db    "c>b"
; ----------------------------------------
    db    8
    db    FirstCodePage
    dw    def_63_3e_72
    db    3
    db    "c>r"
; ----------------------------------------
    db    7
    db    FirstCodePage
    dw    def_63_40
    db    2
    db    "c@"
; ----------------------------------------
    db    9
    db    FirstCodePage
    dw    def_63_6f_70_79
    db    4
    db    "copy"
; ----------------------------------------
    db    9
    db    FirstCodePage
    dw    def_66_69_6c_6c
    db    4
    db    "fill"
; ----------------------------------------
    db    9
    db    FirstCodePage
    dw    def_68_61_6c_74
    db    4
    db    "halt"
; ----------------------------------------
    db    8
    db    FirstCodePage
    dw    def_6d_6f_64
    db    3
    db    "mod"
; ----------------------------------------
    db    8
    db    FirstCodePage
    dw    def_6e_6f_74
    db    3
    db    "not"
; ----------------------------------------
    db    7
    db    FirstCodePage
    dw    def_6f_72
    db    2
    db    "or"
; ----------------------------------------
    db    7
    db    FirstCodePage
    dw    def_70_21
    db    2
    db    "p!"
; ----------------------------------------
    db    7
    db    FirstCodePage
    dw    def_70_40
    db    2
    db    "p@"
; ----------------------------------------
    db    8
    db    FirstCodePage
    dw    def_70_6f_70
    db    3
    db    "pop"
; ----------------------------------------
    db    9
    db    FirstCodePage
    dw    def_70_75_73_68
    db    4
    db    "push"
; ----------------------------------------
    db    8
    db    FirstCodePage
    dw    def_72_3e_61
    db    3
    db    "r>a"
; ----------------------------------------
    db    9
    db    FirstCodePage
    dw    def_72_3e_61_62
    db    4
    db    "r>ab"
; ----------------------------------------
    db    10
    db    FirstCodePage
    dw    def_72_3e_61_62_63
    db    5
    db    "r>abc"
; ----------------------------------------
    db    8
    db    FirstCodePage
    dw    def_72_3e_62
    db    3
    db    "r>b"
; ----------------------------------------
    db    8
    db    FirstCodePage
    dw    def_72_3e_63
    db    3
    db    "r>c"
; ----------------------------------------
    db    9
    db    FirstCodePage
    dw    def_73_77_61_70
    db    4
    db    "swap"
; ----------------------------------------
    db    8
    db    FirstCodePage
    dw    def_78_6f_72
    db    3
    db    "xor"

    db    0
