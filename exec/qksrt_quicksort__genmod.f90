        !COMPILER-GENERATED INTERFACE MODULE: Tue Mar 10 22:11:05 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE QKSRT_QUICKSORT__genmod
          INTERFACE 
            RECURSIVE SUBROUTINE QKSRT_QUICKSORT(N,LIST,START,END)
              INTEGER(KIND=4), INTENT(IN) :: N
              INTEGER(KIND=4), INTENT(INOUT) :: LIST(N)
              INTEGER(KIND=4), INTENT(IN) :: START
              INTEGER(KIND=4), INTENT(IN) :: END
            END SUBROUTINE QKSRT_QUICKSORT
          END INTERFACE 
        END MODULE QKSRT_QUICKSORT__genmod
