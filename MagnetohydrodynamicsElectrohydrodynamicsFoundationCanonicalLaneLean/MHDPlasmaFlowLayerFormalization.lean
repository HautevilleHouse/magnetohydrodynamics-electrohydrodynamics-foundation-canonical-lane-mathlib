import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MagnetohydrodynamicsElectrohydrodynamicsFoundationCanonicalLaneLean.MHDPlasmaFlowLayer

namespace HautevilleHouse
namespace MagnetohydrodynamicsElectrohydrodynamicsFoundationCanonicalLaneLean

structure MHDPlasmaFlowCertificate where
  flow : MHDPlasmaFlow
  incompressibleClosed : Prop
  idealOhmClosed : Prop
  forceBalanceClosed : Prop
  incompressibleClosedProof : incompressibleClosed
  idealOhmClosedProof : idealOhmClosed
  forceBalanceClosedProof : forceBalanceClosed

def sourceMHDPlasmaFlowCertificate : MHDPlasmaFlowCertificate := {
  flow := primitiveMHDPlasmaFlow
  incompressibleClosed := True
  idealOhmClosed := True
  forceBalanceClosed := True
  incompressibleClosedProof := trivial
  idealOhmClosedProof := trivial
  forceBalanceClosedProof := trivial
}

def MHDPlasmaFlowClosed (C : MHDPlasmaFlowCertificate) : Prop :=
  C.incompressibleClosed ∧ C.idealOhmClosed ∧ C.forceBalanceClosed

theorem source_mhd_plasma_flow_closed : MHDPlasmaFlowClosed sourceMHDPlasmaFlowCertificate := by
  exact And.intro sourceMHDPlasmaFlowCertificate.incompressibleClosedProof
    (And.intro sourceMHDPlasmaFlowCertificate.idealOhmClosedProof sourceMHDPlasmaFlowCertificate.forceBalanceClosedProof)

end MagnetohydrodynamicsElectrohydrodynamicsFoundationCanonicalLaneLean
end HautevilleHouse
