        !COMPILER-GENERATED INTERFACE MODULE: Thu Dec  5 22:32:18 2019
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
