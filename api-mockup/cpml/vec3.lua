---@class vec3
---@field x number X Value
---@field y number Y Value
---@field z number Z Value
vec3 = {}
vec3.__index = vec3


---Create a new vector containing the same data.
---@return vec3
function vec3:clone() end

---Unpack the vector into its components.
---@return number
---@return number
---@return number
function vec3:unpack() end

---Dot product.
---@param a vec3 first vec3 to dot with
---@param b vec3 second vec3 to dot with
---@return number
function vec3.dot(a, b) end

--- @return number
function vec3:len2() end

---Vector length/magnitude.
---@return number
function vec3:len() end

---Distance between two points.
---@param a vec3 first point
---@param b vec3 second point
---@return number
function vec3.dist(a, b) end

---Squared distance between two points.
---@param a vec3 first point
---@param b vec3 second point
---@return number
function vec3.dist2(a, b) end

---Normalize vector. Scales the vector in place such that its length is 1.
---@return vec3
function vec3:normalize_inplace() end

---Normalize vector. Returns a copy of the vector scaled such that its length is 1.
---@return vec3
function vec3:normalize() end

---Rotate vector about an axis.
---@param phi number Amount to rotate, in radians
---@param axis number Axis to rotate by
---@return vec3 Return rotated vector
function vec3:rotate(phi, axis) end

---@return vec3 Return perpendicular vector
function vec3:perpendicular() end

---@param v vec3
---@return vec3 Projection of the vector on target
function vec3:project_on(v) end

---Project on plane containing origin
---@param plane_normal vec3
---@return vec3 Projection of the vector on target
function vec3:project_on_plane(plane_normal) end

---Does the reverse of projectOn.
---@param v vec3
---@return vec3
function vec3:project_from(v) end

---Mirror the vector.
---@param v vec3
---@return vec3
function vec3:mirror_on(v) end

---Cross product.
---@param v vec3 Vector to cross with
---@return vec3
function vec3:cross(v) end

---@param maxLen number
---@return vec3
function vec3:trim_inplace(maxLen) end

---@param maxLen number
---@return vec3
function vec3:trim(maxLen) end

---Angle to other vector. Only makes sense in 2D.
---@param other vec3
---@return number
function vec3:angle_to(other) end

---Angle between both vector.
---@param other vec3
---@return number
function vec3:angle_between(other) end

---@return vec3
function vec3:orientation_to_direction(orientation) end

---@param a vec3
---@param b vec3
---@param s number
---@return vec3
function vec3.lerp(a, b, s) end
