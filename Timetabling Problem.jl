import Pkg
Pkg.add("JuMP")
Pkg.add("GLPK")
using JuMP, GLPK

model = Model(with_optimizer(GLPK.Optimizer))

@variable(model, color, Int)
@variable(model, c[1:49,1:4], Bin)

@objective(model, Min, color)

for s=1:10
    @constraint(model, sum(c[s,1:4]) == 1)
end

for s=1:10, i=1:4
    @constraint(model, color >= i*c[s,i])
end

for i=1:4 

        @constraint(model, c[1,i] + c[2,i] <= 1) 
        @constraint(model, c[1,i] + c[3,i] <= 1) 
        @constraint(model, c[2,i] + c[1,i] <= 1) 
        @constraint(model, c[2,i] + c[3,i] <= 1) 
        @constraint(model, c[2,i] + c[7,i] <= 1) 
        @constraint(model, c[3,i] + c[2,i] <= 1) 
        @constraint(model, c[3,i] + c[1,i] <= 1) 
        @constraint(model, c[3,i] + c[8,i] <= 1) 
        @constraint(model, c[3,i] + c[5,i] <= 1) 
        @constraint(model, c[3,i] + c[9,i] <= 1) 
        @constraint(model, c[4,i] + c[5,i] <= 1) 
        @constraint(model, c[4,i] + c[6,i] <= 1) 
        @constraint(model, c[5,i] + c[3,i] <= 1) 
        @constraint(model, c[5,i] + c[4,i] <= 1)
        @constraint(model, c[5,i] + c[8,i] <= 1)
        @constraint(model, c[5,i] + c[9,i] <= 1)
        @constraint(model, c[6,i] + c[4,i] <= 1)
        @constraint(model, c[6,i] + c[7,i] <= 1)
        @constraint(model, c[6,i] + c[8,i] <= 1)
        @constraint(model, c[7,i] + c[2,i] <= 1)
        @constraint(model, c[7,i] + c[6,i] <= 1)
        @constraint(model, c[7,i] + c[8,i] <= 1)
        @constraint(model, c[8,i] + c[3,i] <= 1)
        @constraint(model, c[8,i] + c[5,i] <= 1)
        @constraint(model, c[8,i] + c[6,i] <= 1)
        @constraint(model, c[8,i] + c[7,i] <= 1)
        @constraint(model, c[8,i] + c[9,i] <= 1)
        @constraint(model, c[9,i] + c[3,i] <= 1)
        @constraint(model, c[9,i] + c[5,i] <= 1)
        @constraint(model, c[9,i] + c[8,i] <= 1)
        @constraint(model, c[9,i] + c[10,i] <= 1)
        @constraint(model, c[10,i] + c[9,i] <= 1)

        
       
end

optimize!(model)
println("minimum colors are ", JuMP.objective_value(model))
color_washington = findmax(JuMP.value.(c[1,:]))
color_washington2 = findmax(JuMP.value.(c[2,:]))
color_washington3= findmax(JuMP.value.(c[3,:]))
color_washington4 = findmax(JuMP.value.(c[4,:]))
println(JuMP.value(c[1,1]))
println("color_washington: ", color_washington)
println("color_washington: ", color_washington2)
println("color_washington: ", color_washington3)
println("color_washington: ", color_washington4)





