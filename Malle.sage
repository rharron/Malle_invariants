def indg(g):
    """
    Returns the index of the permutation g

    The index of a permutation is its degree (i.e. the cardinality of the
    set on which it's acting) minus the number of orbits it has on the set
    on which it's acting.
    """
    n = g.parent().degree()
    return n - len(g.cycle_type())

def indG(G):
    """
    Returns the index of the permutation group G

    The index of the permutation group is the minimum of the indices of its
    non-identity elements.
    """
    n = G.degree()
    return min([indg(g) for g in G[1:]])

def Malle_a(G):
    """
    Return Malle's a-invariant for the group G

    EXAMPLES::

        sage: for G in TransitiveGroups(5):
                  print G.structure_description(), Malle_a(G)
        C5 1/4
        D5 1/2
        C5 : C4 1/2
        A5 1/2
        S5 1

        sage: for p in prime_range(3,15):
                  print p, Malle_a(DihedralGroup(p))
        3 1
        5 1/2
        7 1/3
        11 1/5
        13 1/6
    """
    return 1 / indG(G)

def Malle_b(G):
    """
    Return Malle's b-invariant for the group G. Note that this returns Malle's initial conjectural value,
    not Türkelli's suggested improvement.

    EXAMPLES::

        sage: for G in TransitiveGroups(5):
                  print G.structure_description(), Malle_b(G)
        C5 1
        D5 1
        C5 : C4 1
        A5 2
        S5 1

        sage: Malle_b(TransitiveGroup(6, 5)) #Klüners' counterexample, the actual asymptotic should give 2
        1
    """
    m = G.order()
    Cs = G.conjugacy_classes()[1:]
    gammas = [a for a in range(1, m) if m.gcd(a) == 1]
    ind = indG(G)
    minCs = [C for C in Cs if indg(C.representative()) == ind]
    no = 0
    while len(minCs) != 0:
        no += 1
        C = minCs[0]
        g = C.representative()
        g_orbit = [(g^gamma).conjugacy_class() for gamma in gammas]
        for C in g_orbit:
            try:
                minCs.remove(C)
            except ValueError:
                pass
    return no
