(*
 * Copyright (c) 2016 - present Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *)

module F = Format

module type Kind = sig
  type t

  val compare : t -> t -> int
  val pp : F.formatter -> t -> unit
end

module type S = sig
  type t

  module Kind : Kind

  val call_site : t -> CallSite.t
  val kind : t -> Kind.t

  val make : Kind.t -> CallSite.t -> t
  val with_callsite : t -> CallSite.t -> t

  val pp : F.formatter -> t -> unit

  module Set : PrettyPrintable.PPSet with type elt = t
end
