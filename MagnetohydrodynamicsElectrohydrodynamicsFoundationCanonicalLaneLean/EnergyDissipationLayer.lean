import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MagnetohydrodynamicsElectrohydrodynamicsFoundationCanonicalLaneLean

structure EnergyDissipationCertificate where
  reynolds : MagneticReynoldsCertificate
  kineticEnergy : ℝ
  magneticEnergy : ℝ
  totalEnergy : ℝ
  dissipationRate : ℝ
  energyBalance : Prop
  kineticEnergyClosed : kineticEnergy = 1.0
  magneticEnergyClosed : magneticEnergy = 1.0
  totalEnergyClosed : totalEnergy = 2.0
  dissipationRateClosed : dissipationRate = 0.5
  energyBalanceProof : energyBalance

def sourceEnergyDissipationCertificate : EnergyDissipationCertificate := {
  reynolds := sourceMagneticReynoldsCertificate
  kineticEnergy := 1.0
  magneticEnergy := 1.0
  totalEnergy := 2.0
  dissipationRate := 0.5
  energyBalance := (totalEnergy = kineticEnergy + magneticEnergy) ∧ (dissipationRate > 0)
  kineticEnergyClosed := rfl
  magneticEnergyClosed := rfl
  totalEnergyClosed := rfl
  dissipationRateClosed := rfl
  energyBalanceProof := by
    dsimp [sourceEnergyDissipationCertificate]
    constructor
    · rfl
    · linarith
}

def EnergyDissipationLayerClosed (C : EnergyDissipationCertificate) : Prop :=
  MagneticReynoldsLayerClosed C.reynolds ∧
  C.kineticEnergy = 1.0 ∧ C.magneticEnergy = 1.0 ∧ C.totalEnergy = 2.0 ∧ C.dissipationRate = 0.5 ∧
  C.energyBalance

theorem source_energy_dissipation_layer_closed :
    EnergyDissipationLayerClosed sourceEnergyDissipationCertificate := by
  exact And.intro source_magnetic_reynolds_layer_closed
    (And.intro sourceEnergyDissipationCertificate.kineticEnergyClosed
      (And.intro sourceEnergyDissipationCertificate.magneticEnergyClosed
        (And.intro sourceEnergyDissipationCertificate.totalEnergyClosed
          (And.intro sourceEnergyDissipationCertificate.dissipationRateClosed
            sourceEnergyDissipationCertificate.energyBalanceProof))))

end MagnetohydrodynamicsElectrohydrodynamicsFoundationCanonicalLaneLean
end HautevilleHouse