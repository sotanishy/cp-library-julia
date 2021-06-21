module ModInts

import Base: (==), (+), (-), (*)

export ModInt, modulus, value

struct ModInt{M,T} <: Number
    val::T

    function ModInt{M,T}(x::Integer) where {M,T<:Integer}
        @assert M isa T
        new{M,T}(mod(x, M))
    end
end

modulus(_::ModInt{M}) where M = M
value(a::ModInt{M}) where M = a.val
==(x::ModInt{M,T}, y::ModInt{M,T}) where {M,T} = value(x) == value(y)
-(x::ModInt{M,T}) where {M,T} = ModInt{M,T}(-value(x))
+(x::ModInt{M,T}, y::ModInt{M,T}) where {M,T} = ModInt{M,T}(value(x) + value(y))
-(x::ModInt, y::ModInt) = x + (-y)
*(x::ModInt{M,T}, y::ModInt{M,T}) where {M,T} = ModInt{M,T}(value(x) * value(y))

Base.promote_rule(::Type{ModInt{M,T}}, ::Type{T2}) where {M,T,T2<:Integer} = ModInt{M,T}

end # end of module ModInts
