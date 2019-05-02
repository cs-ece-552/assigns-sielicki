j .label2
.label01:
add r7, r6, r5
add r0, r7, r6
halt

.label2:
j .label3:
.label02
add r5, r3, r4
add r6, t5, r4
j .label01

.label3:
j .label4
.label03:
add r3, r1, r2
add r4, r3, r2
j .label02

.label4:
lbi r0, 1
lbi r1, 2
add r2, r0, r1
j .label03
