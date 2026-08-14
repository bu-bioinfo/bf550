import numpy as np
rng = np.random.default_rng(7)
N_IND = 50          # individuals per population -> 100 alleles

def freq(n_ind, p, r):
    """observed allele frequency among n_ind diploid individuals"""
    return (r.random((n_ind, 2)) < p).sum() / (2 * n_ind)

print("="*62); print("WEEK 2 — many loci, null distribution, multiple testing"); print("="*62)
L = 1000
base = rng.uniform(0.15, 0.85, L)          # each locus its own frequency, SAME in both pops
obs = np.array([freq(N_IND, p, rng) - freq(N_IND, p, rng) for p in base])

# null distribution by simulation, per locus
def pval(p, d, r, B=400):
    null = np.array([freq(N_IND, p, r) - freq(N_IND, p, r) for _ in range(B)])
    return (np.abs(null) >= abs(d)).mean()

pv = np.array([pval(base[i], obs[i], rng) for i in range(L)])
print(f"p-value mean {pv.mean():.3f} (uniform -> 0.5), median {np.median(pv):.3f}")
for t in (0.01, 0.05, 0.10):
    print(f"  p < {t:<5} : {(pv<t).sum():>4} of {L}   (expected ~{int(t*L)})")

# now add真 real differences
print("\n-- with 50 truly-different loci added (delta = 0.20) --")
real = 50
pA = rng.uniform(0.2, 0.6, real); pB = pA + 0.20
obs_r = np.array([freq(N_IND, pA[i], rng) - freq(N_IND, pB[i], rng) for i in range(real)])
pv_r = np.array([pval((pA[i]+pB[i])/2, obs_r[i], rng) for i in range(real)])
print(f"  detected at p<0.05 : {(pv_r<0.05).sum()} of {real}  (power {(pv_r<0.05).mean():.2f})")
print(f"  false positives among the 1000 nulls at 0.05: {(pv<0.05).sum()}")
print(f"  -> of {(pv<0.05).sum()+(pv_r<0.05).sum()} 'discoveries', {(pv<0.05).sum()} are wrong")

print("\n"+"="*62); print("WEEK 3 — mixture of two populations"); print("="*62)
L3, W_TRUE = 200, 0.30
pA3 = rng.uniform(0.6, 0.9, L3); pB3 = rng.uniform(0.1, 0.4, L3)   # informative markers
def mix_obs(w, pa, pb, r, n=N_IND):
    return np.array([freq(n, w*pa[i] + (1-w)*pb[i], r) for i in range(len(pa))])
data = mix_obs(W_TRUE, pA3, pB3, rng)
print("informative markers (pA far from pB):")
for w in np.arange(0.0, 1.01, 0.1):
    pred = w*pA3 + (1-w)*pB3
    print(f"   w={w:.1f}  SSE={((data-pred)**2).sum():7.3f}")

print("\nUNINFORMATIVE markers (pA ~ pB) -> w unidentifiable:")
pA4 = rng.uniform(0.45,0.55,L3); pB4 = rng.uniform(0.45,0.55,L3)
data4 = mix_obs(W_TRUE, pA4, pB4, rng)
sse=[((data4-(w*pA4+(1-w)*pB4))**2).sum() for w in np.arange(0,1.01,0.1)]
print("   SSE across w:", " ".join(f"{s:.2f}" for s in sse))
print(f"   spread of SSE = {max(sse)-min(sse):.3f}  (flat => cannot estimate w)")

print("\n"+"="*62); print("WEEK 4 — nesting: allele frequency itself varies"); print("="*62)
MEAN = 0.30
for k in (None, 100, 20):
    if k is None:
        ps = np.full(2000, MEAN); lab = "fixed p = 0.30"
    else:
        ps = rng.beta(MEAN*k, (1-MEAN)*k, 2000); lab = f"p ~ Beta(mean .30, k={k})"
    counts = np.array([(rng.random((N_IND,2)) < p).sum() for p in ps])
    print(f"  {lab:<28} mean={counts.mean():5.1f}  sd={counts.std():5.2f}")

print("\n-- applying the fixed-p test to overdispersed data --")
for k in (None, 100, 20):
    if k is None:
        gen = lambda: MEAN
        lab = "fixed p (assumption holds)"
    else:
        gen = lambda: rng.beta(MEAN*k, (1-MEAN)*k); lab = f"overdispersed k={k}"
    d = np.array([freq(N_IND, gen(), rng) - freq(N_IND, gen(), rng) for _ in range(600)])
    null = np.array([freq(N_IND, MEAN, rng) - freq(N_IND, MEAN, rng) for _ in range(3000)])
    crit = np.quantile(np.abs(null), 0.95)
    print(f"  {lab:<28} false positive rate = {(np.abs(d)>crit).mean():.3f}  (should be 0.05)")
