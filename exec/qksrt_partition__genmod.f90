        !COMPILER-GENERATED INTERFACE MODULE: Mon Dec  9 22:47:57 2019
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE QKSRT_PARTITION__genmod
          INTERFACE 
            FUNCTION QKSRT_PARTITION(N,LIST,START,END) RESULT(TOP)
              INTEGER(KIND=4), INTENT(IN) :: N
              INTEGER(KIND=4), INTENT(INOUT) :: LIST(N)
              INTEGER(KIND=4), INTENT(IN) :: START
              INTEGER(KIND=4), INTENT(IN) :: END
              INTEGER(KIND=4) :: TOP
            END FUNCTION QKSRT_PARTITION
          END INTERFACE 
        END MODULE QKSRT_PARTITION__genmod
