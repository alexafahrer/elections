# project-2


# U.S. Presidential Election Results (1976-2020)

## Description

This dataset is comprised of results from U.S. presidential elections spanning from 1976 to 2020. Each record in the dataset represents the number of votes a candidate received in a particular state for a specific year. The dataset includes details such as the year, state, party affiliation, and total votes cast.

## Data Collection Methods

The data were compiled from official sources by political science researchers. It encompasses nationwide presidential election results, broken down by state. The dataset does not specify the individual sources for each year; however, election results are typically sourced from state secretaries of state and historical archives.

## Data Structure

The dataset is provided in CSV format and contains the following columns:

- `year`: The year of the election.
- `state`: The name of the state.
- `state_po`: The postal abbreviation for the state.
- `state_fips`: The FIPS code of the state.
- `state_cen`: The U.S. Census Bureau's state code.
- `state_ic`: The ICPSR state code.
- `office`: The name of the office (U.S. President).
- `candidate`: The name of the candidate.
- `party_detailed`: The detailed party affiliation of the candidate.
- `writein`: Indicates whether the candidate was a write-in.
- `candidatevotes`: The number of votes the candidate received.
- `totalvotes`: The total number of votes cast in the state.
- `version`: The version of the data file.
- `notes`: Additional notes regarding the election results (this column is empty in the provided dataset).
- `party_simplified`: The simplified party affiliation of the candidate.

## Data Cleaning and Processing

No additional cleaning or processing has been performed on this dataset. The dataset is presented as-is from the original compilation. Users should note that there may be inconsistencies or missing data, particularly in the `candidate` and `party_detailed` columns.


