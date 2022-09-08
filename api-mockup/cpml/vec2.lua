---@class vec2
vec2 = vec2()
vec2.__index = vec2


---Create a new vector containing the same data.
---@return vec2
function vec2:clone() end

---Unpack the vector into its components.
---@return number
---@return number
function vec2:unpack() end

---Dot product.
---@param a vec2 first vec2 to dot with
---@param b vec2 second vec2 to dot with
---@return number
function vec2.dot(a, b) end

--- @return number
function vec2:len2() end

---Vector length/magnitude.
---@return number
function vec2:len() end

---Distance between two points.
---@param a vec2 first point
---@param b vec2 second point
---@return number
function vec2.dist(a, b) end

---Squared distance between two points.
---@param a vec2 first point
---@param b vec2 second point
---@return number
function vec2.dist2(a, b) end

---Normalize vector. Scales the vector in place such that its length is 1.
---@return vec2
function vec2:normalize_inplace() end

---Normalize vector. Returns a copy of the vector scaled such that its length is 1.
---@return vec2
function vec2:normalize() end

---Rotate vector about an axis.
---@param phi number Amount to rotate, in radians
---@return vec2 Return rotated vector
function vec2:rotate_inplace(phi) end

---Rotate vector about an axis.
---@param phi number Amount to rotate, in radians
---@return vec2 Return rotated vector
function vec2:rotate(phi) end

---@return vec2 Return perpendicular vector
function vec2:perpendicular() end

---Mirror the vector.
---@param v vec2
---@return vec2
function vec2:mirror_on(v) end

---Cross product.
---@param v vec2 Vector to cross with
---@return vec2
function vec2:cross(v) end

---@param maxLen number
---@return vec2
function vec2:trim_inplace(maxLen) end

---@param maxLen number
---@return vec2
function vec2:trim(maxLen) end

---Angle to other vector. Only makes sense in 2D.
---@param other vec2
---@return number
function vec2:angle_to(other) end

---@param a vec2
---@param b vec2
---@param s number
---@return vec2
function vec2.lerp(a, b, s) end

