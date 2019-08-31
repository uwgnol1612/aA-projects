export const RECEIVE_BENCHES = "RECEIVE_BENCHES";

import { fetchBenches } from '../util/bench_api_util';

export const receiveBenches = (benches) => ({
    type: RECEIVE_BENCHES,
    benches
});

export const requestBenches = (bounds) => (dispatch) => (
    fetchBenches(bounds).then((benches) => dispatch(receiveBenches(benches)))
);





