% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calc.R
\name{convert_conc}
\alias{convert_conc}
\title{Convert a value of the given concentration into another concentration.}
\usage{
convert_conc(x, from, to, molar_mass = 0, density_solute = 0,
  density_solution = 0)
}
\arguments{
\item{x}{The value to convert.}

\item{from}{A string containing the units of concentration A.}

\item{to}{A string containing the units of concentration B.}

\item{molar_mass}{The molar mass of the solute (g / mol).}

\item{density_solute}{The density of the solute (g / l).}

\item{density_solution}{The density of the solution (g / l), not the solvent!}
}
\value{
The converted value.
}
\description{
A convenience wrapper around \code{\link[=calc_factor_conc]{calc_factor_conc()}}.
}
\details{
The following concentrations can be converted:

mass / volume:
".g / .l", ".g / .m^3", "\% w / v"

molar / volume:
".M", ".mol / .l",  ".mol / .m^3"

volume / volume:
".l/.l", ".l / m^3", ".m^3/.m^3", ".m^3 / .l", "\% v / v", "v / v"

mass / mass:
".g / .g", "w / w", "\% w / w"

Where "." symbolizes a metric prefix (see \code{\link[=calc_factor_prefix]{calc_factor_prefix()}}) :

For g, l, mol and M: d (deci), c (centi), m (milli), µ (micro), n (nano),
p (pico) and f (femto).

For g you might use k (kilo) as well.

For m^3 (cubic metres) you may only use: d (deci), c (centi) and m (milli).

Note: \% w / v is (incorrectly) taken as a short hand for 0.1 g / l.
}
\examples{
library("dplyr")

# generate test data
data <- tibble(
  sample = c("A", "B", "C"),
  conc = c(4.5, 2.3, 5.1),       # concentration in g  / l
)

data \%>\%
  mutate(
    conc_ng_ml = convert_conc(x = conc, from = "g/l", to = "ng/ml"),
    # give molar mass in g / mol
    conc_mol_l = convert_conc(
      x = conc, from = "g/l", to = "M", molar_mass = 78.971),
    # give densities in g / l
    conc_pc = convert_conc(
      x = conc, from = "g/l", to = "\%v/v", density_solute = 4810)
)

# throws an error
\dontrun{
# will throw an error because molar_mass is missing
fail <- convert_conc(x = 5, from = "g/l", to = "mol/l")
}

}
\seealso{
Other conversion functions: \code{\link{calc_factor_conc}},
  \code{\link{calc_factor_prefix}},
  \code{\link{convert_prefix}}
}
